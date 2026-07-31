Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597C3E1D07;
	Fri, 31 Jul 2026 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492000; cv=none; b=INaQ9/LGUhun8wTn7Mk5L7MNkwMU7Dhbv0MTCr5OG7VETpmwJfUfvNzzDGjBXjgk4RqIp5XUTnsdrsnGx2RE9tbXT5qmkBzrYmGZBPBfB5kb64yi7D61Fo7+oVOw4gExG9oqkgi0ZKEZa9jQTgIOkP01Azu2w/5qz7EcmuucOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492000; c=relaxed/simple;
	bh=FCMvUYnKSr5rGWKV+jrtsbmW326hs58ou8eNJ69cteU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWxi1A23ZB7SuUJGhx39vbqdrgSGrXydRvAMLXr9UzZneCss9N50Rs2kpEDPjeS5n4WfZF7kiGSr+EX4IS6ZR36Azr35XB/t76+FeAaTdi9OfIbocZ8i/8PxxWrmaYoc6he6I0ruPOzWxK7apwFjsPp020LXh/PEM0Is1o5/qH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiDrlM32; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiDrlM32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE58C1F00A3A;
	Fri, 31 Jul 2026 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491981;
	bh=+snZUMpLmLGblUL74JEV2r6JGb5ryhxySR/L52Et47s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JiDrlM32dAyczUdg31my6Ox6OC+83lCay6naSUi9jdbKW/QY0qAWgOT/mMPO+NF8d
	 vyEbzyLMnioInnM5R5bMsJLfhUxmzKzjbXxznfdR18rIHWkOHv5bup4NFU9vWQUG7A
	 Mq8TA0TSAkBzc7EyNlrFw7+D9gZuV+pGkHL8Dt35kEIzsjKrfLHFvM4MD4asxnNb9w
	 Dg4rSIFDxm/5iZJFZbQwGZBlWq5GpKwhU7zaSPoNbw5CHglVTWNU00WfyeCO08uYXC
	 L9pNEzU+UIH/hZtMA3kbNMCM6lHS4C5/1/JOkFmkPkSFAmQ83RUasgPOzIRUIargAw
	 yo82sq/d8E25Q==
Date: Fri, 31 Jul 2026 11:59:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: ucsi_glink: Add compatible
 string for SM8475
Message-ID: <20260731-light-kelpie-of-will-8b71bb@quoll>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>

On Fri, Jul 31, 2026 at 01:00:09AM -0400, Esteban Urrutia wrote:
> Add compatible string for the PMIC GLINK service running on the coprocessor
> found in the SM8475 SoC.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 12e07b9fe622..78a0ea349ed4 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -381,6 +381,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
>  	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
>  	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
> +	{ .compatible = "qcom,sm8475-pmic-glink", .data = &quirk_sm8450, },

Really, you just wrote IT IS DIFFERENT in the bindings, so how can it be the same data?

Best regards,
Krzysztof

