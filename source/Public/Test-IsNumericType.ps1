<#
    .SYNOPSIS
        Returns whether the specified object is of a numeric type.

    .DESCRIPTION
        Returns whether the specified object is of a numeric type:

        - [System.Byte]
        - [System.Int16]
        - [System.Int32]
        - [System.Int64]
        - [System.SByte]
        - [System.UInt16]
        - [System.UInt32]
        - [System.UInt64]
        - [System.Decimal]
        - [System.Double]
        - [System.Single]

    .PARAMETER Object
       The object to test if it is a numeric type.

    .EXAMPLE
        Test-IsNumericType -Object ([System.UInt32] 1)

        Returns `$true` since the object passed is of a numeric type.

    .EXAMPLE
        ([System.String] 'a') | Test-IsNumericType

        Returns `$false` since the value is not a numeric type.

    .EXAMPLE
        ('a', 2, 'b') | Test-IsNumericType

        Returns `$true` since one of the values in the array is of a numeric type.

    .OUTPUTS
        [System.Boolean]

    .NOTES
        When passing in an array of values from the pipeline, the command will return
        $true if any of the values in the array is numeric.
#>
function Test-IsNumericType
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(ValueFromPipeline = $true)]
        [System.Object]
        $Object
    )

    begin
    {
        $isNumeric = $false
    }

    process
    {
        if (
            $Object -is [System.Byte] -or
            $Object -is [System.Int16] -or
            $Object -is [System.Int32] -or
            $Object -is [System.Int64] -or
            $Object -is [System.SByte] -or
            $Object -is [System.UInt16] -or
            $Object -is [System.UInt32] -or
            $Object -is [System.UInt64] -or
            $Object -is [System.Decimal] -or
            $Object -is [System.Double] -or
            $Object -is [System.Single]
        )
        {
            $isNumeric = $true
        }
    }

    end
    {
        return $isNumeric
    }
}
