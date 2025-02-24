Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C9567D
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356287; cv=none; b=ok8SfjURk9TLVCruVSZyTUqzCvqavkE+2xyh8IsJcmjeK07K78mK8KsqQpBLtWAAMKGy6ZydfhqDdNlhGyr4BRnONkxR0ruGMVHzWD0TM3R9O+5Cs1Y6Cx3g8gaHT9zeF1aTns+Dmu8V8+NqHkm5lt7CHKLe9MpN5Wi3z93RsBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356287; c=relaxed/simple;
	bh=JdCnAXnxYid1mxV4nHuT8i/PGJKEdfOulCrTZSYikBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMno++OGb/ghSZAcSGzFkqpHmv/5xe7BHUh+xBjeK2FSNBnTFt76HZWzXaAFBOUc7SzorCGMHQmmzASKSTB68zioOTafMBmQkfDDCqgOV1VW71KUSTR/Va7KcvV6+aBNtswKVOrIeWzFc4wu/+ke0Xl+qg6dWjTJKkQCqg/uzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Th+kA8L6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Th+kA8L6"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so10142881fa.3
        for <phone-devel@vger.kernel.org>; Sun, 23 Feb 2025 16:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356282; x=1740961082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nD6DNE71VFEfXcLuCIsfR3SfpPP50CHXY1aUthPY5zE=;
        b=Th+kA8L6xflxjS/Qe3ZZdHKPEM6EHCG7QUQYkp1vQey/QbWg6bk146ScDbXjT+S6xw
         1SENtouugSpKlUPUI8oZB+HuiD6FvCy1cUB19xYm36kA59JItFEkb6q9hw5Vi3AiFpDS
         tFdwRaMBxbj/gyrl5J0qmp3UxacBTeQP44Dp6F/VQcbrk5wcAHGt8cFcxuon/s0qw2e6
         vZMZ7P2fcS1ebMHgEhD1IqqHLauD848n97g0smmRbENghk3GZnZRYplO1lQr/+bIb4x2
         cUgzph3t239+/ZJAr3XnN2j5cZ22s2g0N6OV8A6NsgXJfVREo/1QxdAmC5Ydacpm0uvq
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356282; x=1740961082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD6DNE71VFEfXcLuCIsfR3SfpPP50CHXY1aUthPY5zE=;
        b=VTibATPICly/MvjsoccelnFtWHLUFf/j0zx3Iw+i5eVBqAqqf/UAJ7kbuHdRjJHrWK
         sJP21x4F4sEFa5sjxwzUPge0cEGDySjDsXVvEtibFAsqpca0wL1J+VpGOiB3a/pyIAGp
         xtC0cJgR3FEq/YjHf0mVf14WeyHQkOTnnyK/JKeDHgQzU+kipegJBhAwYRx7zHq0W3yO
         Q1jpkUlOXsRwNRqxEawT7IUxJknyLfza+m6Lf1Q7veIBs7WSAMHVTRxEWm6SsDzKtnHn
         AZArUmQaPVUyXAu+Jaz+INtizi9kjBpgtlLMa6hkqKtCQ98DqGfvzRuFuRFuT6ACLgnr
         geMA==
X-Forwarded-Encrypted: i=1; AJvYcCUpI27BWNUaGVQx1xXzTNIX6E2qI7OAH/5dnkYl4mZtJ9liGvLirPT8GyqfAZfvNJWr0y+HyGlqD+PX+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0l6GEMieQlHQLjEOhXOtcjw0LppxuhjAmclx/hNztoPBUoB0
	a0RLNbW+ikXd6+/cBkjbSce+UKXeJlLV1Ujj4TBWuRFaLQe204BMOL8KEkvagTM=
X-Gm-Gg: ASbGnctE8KoM6h37uqDtYXxd0XlBfbaMeRFU06Y17EmXnQ6M9+cQXV7eb1RcT7TL8ux
	thBAJRMSb8eBSaUGZpJ4EEkM9qgPsiQB+dGDZg2dai0McoImPjAZXGSoPNwEAZssI1VgA5yM13p
	uiPcVkNHdGbnKJcJBSMPgvRPt8u+/LE1lmrC/IHaP59SwX+gjwtlK4BjdVkub8sG59Ym0LMZ0f8
	gb6hCGRrUidV3HRLwTEk+0sJCD9TsBu9GAiA5z19DM1iLYqa9vsVbUmUTAEonkwfAjOEVDM+5zN
	0p453Dqz6GQmmS9b4Pwp4YPIOfocEU0AsZ6gpUMrgYnfYk71o9jX/rWAlLE3Zrjr+6qvgHbN//S
	8Mh+HaA==
X-Google-Smtp-Source: AGHT+IEfy+mm+LIBEpBFk9ATKeXnV1ESjvN4vtfFY3zzlgmNDuwjPP+io43Va+DxHetU2qnplQe2kg==
X-Received: by 2002:a05:6512:e96:b0:545:d08:86 with SMTP id 2adb3069b0e04-54838edda43mr4361626e87.5.1740356280998;
        Sun, 23 Feb 2025 16:18:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545318f4027sm2635082e87.141.2025.02.23.16.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:18:00 -0800 (PST)
Date: Mon, 24 Feb 2025 02:17:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
Message-ID: <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:49PM +0100, Luca Weiss wrote:
> Set the paths where the device-specific firmware can be found for this
> device.
> 
> Fairphone 3 was shipped with secure-boot off so any testkey-signed
> firmware is accepted.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> @@ -82,6 +82,8 @@ nfc@28 {
>  };
>  
>  &lpass {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";

If any firmware is okay, wouldn't it be better to use
"qcom/msm8953/foo.mbn" ? This way if we get any of the firmware (yeah,
I'm a dreamer), then FB3 can pick it up.

> +
>  	status = "okay";
>  };
>  
> @@ -297,11 +299,16 @@ &usb_dwc3_hs {
>  };
>  
>  &wcnss {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/wcnss.mbn";
>  	vddpx-supply = <&pm8953_l5>;
>  
>  	status = "okay";
>  };
>  
> +&wcnss_ctrl {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/WCNSS_qcom_wlan_nv.bin";

then this can become "qcom/msm8953/WCNSS_qcom_wlan_nv_fp3.bin"

> +};
> +
>  &wcnss_iris {
>  	compatible = "qcom,wcn3680";
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
