Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950E2581
	for <phone-devel@vger.kernel.org>; Sun, 14 Dec 2025 00:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670975; cv=none; b=If7XskiH9nDCEp/v8mbJfpafcmMi3t1RsidHIuMHS8lkZ9fvuVxZHW27ZeD7b3r3ySx4fDhhquaa7F+QvqwaCSy2ucWiW6LBPBa6NNSheton/DayFwBPyC+GU8krPe/eSkPDguVxvKGnFTTcqPTqyPg9qSSsuumBL7DXPPjalBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670975; c=relaxed/simple;
	bh=sgNSVyUVIlQGl+4yq6gFL7+dAkwlztttag9JjuKcAB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTmVkeXJlAlvCnH798KNx8iR/Z0aovPxGdsG0EGGLT56q9RoxlTig/StHEucRuniWuDLGRcYadVGQfEfRkAEqvTnhKXx/fTy2tpJ37xSHQnAL2XNYizCGw8oxYC0u/xpcyKGRzxRGDxmQwujH0M04eOdocpSilVVu2HPfKLhgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+GfDfPZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+GfDfPZ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-597c366f2feso269791e87.3
        for <phone-devel@vger.kernel.org>; Sat, 13 Dec 2025 16:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765670971; x=1766275771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLbZpeVWxhUiA9xdv2yvpF5kwmnyurNX54Ve7q/okuU=;
        b=N+GfDfPZ87JYzoR59zM/+8WfSjy6WI1X/m+CBQAkxW4lS8KmXuwjgzu/fYI26l7zuX
         jBbdwEIqsNeqL/WR5gBE8iPXBG1vATlGosqrrorghFnDk0grJo3Apn4UTA/yasAtlhZc
         tZ823kTOA7XjwITOE8/TacFEp+Jnkyu/BSRPR7C64cPc2zTBzHGnj9ZzvWJuJqH2EHY+
         wcHZrbGluVeoIMLrknyj4XhVa+Gj7E3K+RVIhjgWkMgW2VuELUm2iP9P2bCdktgCYeml
         dXX+q9zYbNDJbRdrItlmjlE22mp/z9dPEUEvOyvLvyN+vUGius4u7Fxw9aus2xx92VQz
         yILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670971; x=1766275771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLbZpeVWxhUiA9xdv2yvpF5kwmnyurNX54Ve7q/okuU=;
        b=mc6awZP84+Ip/R5etJMTRJ7wLlvFJyc5Y7Sb2vpSZlL8AMucmmyUCMiDGnjlZVGTom
         9yISqn0xnfDjHyqUF5guVIpnXraJr1KDdfxLC0fCpDAw6vmkULZ6CRJyXUa6r+qXqHtB
         33Nj5bCM/KzdURcHJdA06wGSLkaE9jQHC0L3+gddAkh7zi1LB6RZwwJvJTPalspL/z+2
         erw/Pjf8KzC675kbFhgJjqJvC3BGSQJ9MazP/s/8Q4mM3nknADrHVl1SsWZxFZCLxykR
         ys8BJX4E5kBlUP2Fu6hewUB8S38FNe3n/xA1ZAwSpu1VLQGFAoiGSofZH8aXt8GHOWOg
         Pq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwjcsnuCHcaydXryZyZcITQ3MGuTrUGCaDGoPn+64kgDWKZCQUHSMtLPozV4II3u0ksg7MyMtFaZeG7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqzuYH0tTOgpoFezx41LMACo8+5UjsKywiNdlPh9HRL9dVjegW
	L4k9IwJ53X1ZNcnRVmq220B1Dg3wtXElu/YWB67tF1ClXHxFyb+EIduwZ4kH+lF5zUc=
X-Gm-Gg: AY/fxX60pnRm5CiEVxUugCosytNxnGjFrhBP80pllXFysJJDHOnZB6ipPW6qGgj3Oc2
	d7q7oIt6JLRNKZ2B6mjfp0d2q7xl675zF0lOa9R6UVlHeuxtvAhqA06Lr1NNI6FHAZ9/kKa1Tyl
	stvNdBay3pM1PjC+aO83NkCWNXqz1+xLC9UBBBz2BXSAlPl6GFLOkLisNYw8OMYW9fR89gQew8J
	yjQ0qRBRY2hRZYsASNjDy9/+Ajvk6Sf/Q08cxX5/X86jvqsPONLlz0FS9iDpAvl5nOpbcoyoCie
	49w7wQFutVg/Lovqksod7auWfRd9+r40xvJ+ZpEcTNAqPmNs7Y7Y9cGW9t6KmtPTUXQZG1lhums
	jB2QvUVrBEsQFtEsrAtQ86whPHUb8248At5kggzcZYXXfj0b+pz2GodQUxJwgYt2xg0t8iKLUyr
	PCdYwiwl+e6MTvLjbfFX0Gr+8NRtZgW2vphc2PB5cJf0Cl+JpcE/eTCrTRyhLHKHFcCQ==
X-Google-Smtp-Source: AGHT+IGa33buz/rmba0bIG4qV9RX3OHMcGRTnZkr8Mbi7xgjdbVEw2xZ+1nY7hVGxnE3RNPMJLjOOg==
X-Received: by 2002:a05:6512:3d1b:b0:597:d7d6:398d with SMTP id 2adb3069b0e04-598faa01850mr1324255e87.2.1765670970598;
        Sat, 13 Dec 2025 16:09:30 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3194dbcsm3464122e87.78.2025.12.13.16.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:09:28 -0800 (PST)
Message-ID: <2cb8c5ce-ea80-4cb6-9bef-f526eb433d96@linaro.org>
Date: Sun, 14 Dec 2025 02:09:27 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845: Introduce camera master clock
 pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 14:00, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There are shared for the whole architecture, so let's define these in
> proper place.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index bf2f9c04adba7..97bd9513b011b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2805,6 +2805,49 @@ tlmm: pinctrl@3400000 {
>   			gpio-ranges = <&tlmm 0 0 151>;
>   			wakeup-parent = <&pdc_intc>;
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio13";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk0_sleep: cam-mclk0-sleep-state {
> +				pins = "gpio13";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio14";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_sleep: cam-mclk1-sleep-state {
> +				pins = "gpio14";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio15";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_sleep: cam-mclk2-sleep-state {
> +				pins = "gpio15";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +

Please remove an excessive blank line.

>   			cci0_default: cci0-default-state {
>   				/* SDA, SCL */
>   				pins = "gpio17", "gpio18";
> 

Please add mclk3 to the list, it's one of the gpio16 pad functions.

After adding that

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
