Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A5D515
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356343; cv=none; b=aY0x6blE2yvutrEgm45kD+dFDx94vJHhLz8MSKVNHZlPxOgQk49WzsonGN504cpDNlPYAi9w5T/r5E9e5kZsLXd3Kp3DvsH2aEzp0r4nmo2D2FCn/hu1VgTB2E9l1nAjHNNxG+JoP2oOYz8O78127nyGMojLT3m6o84T+SIZ/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356343; c=relaxed/simple;
	bh=7Jy7dLx7zO3ZkOOyvfUI0Qww8vOfT8OV2kKdICBqy9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7xPc9mMrrVEr3924qKHlEhct0/9PdbxKumeX5TpKzQOwg7xQCme63MBtxclGyKt/3M9dE048bBqfKanIXBPrgxdIjoDLbsMFp1qeHUZBXtpH6sH3nMYitwY++dfsiZPJs/J/OOj2FsKm+mIwcic1H03ii+pntdphAuq8lTQN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxogge4k; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxogge4k"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so10148861fa.3
        for <phone-devel@vger.kernel.org>; Sun, 23 Feb 2025 16:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356339; x=1740961139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGo606DZMNR3CPOmAAdH29sE1yGH7gxkKNN2u18HmZw=;
        b=rxogge4k0F1EP+QODG0E+y6/Qq8Vo9PVYQgUJEDysKAxTIepMkh3DZtSzYNtJfbU+y
         Kd5VqnXIB3S8xAqPSUc+dwUkjshaltdnT+kV6D2XOdkzV+aKqkmSIEU/8Zhd3ol53lJS
         cxoENrK2HHhL9azEZAcpllSEiG22CUYGpfS6CLlpLNAi854eQglGZQ/W4eHpelFnYHoi
         iHH7XP1ZP17Aypb58HxV3uUo5Yjv0nkDsifu6SqDUJW9J3A+R8y4Y02MfnvcZXjRQLJb
         HScTvIzlryx8kCjBeFPJFtqaqGjO4ZO5bLWLXmxXi/LXnjsMgOM5E7gGzhe1LocDX9On
         mRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356339; x=1740961139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGo606DZMNR3CPOmAAdH29sE1yGH7gxkKNN2u18HmZw=;
        b=PEKF90TbUj+OcImSfYWRmtvx4P+ryCKdxa8fvCROQR/2PcKjwzKOinRYhf8DRAhdUq
         exxyEye3+50R03kWPmHjhAuYW+MHvDlTS+ZbI1/kA9hl/CqvtvZqAtt0/eN3KU2hsXuw
         7xWXg63mC1zGPHPnVtlL5ZeOFOzHWjTO+BI9856AXyFGN+K6D7XQy8QNhgeBCgL/3tfs
         uifCC3UEawd9v9Vl8MFyni/JgjtpwLO3fqdk0wBiuDcxPZ1eKMYFVa8GYndCl5TTY+DT
         VcJQ1an5A/EZVzzmJW6Rd+yDnWffVZOjmf/LJW1mq9H59BJlP2Lgn0bXO9iUEGfcKrgV
         J1IA==
X-Forwarded-Encrypted: i=1; AJvYcCXaWJMdqyvWAZL4PksvIRdJ9TwZYkHhOg2fPwp27yS4/6rR+jHTWHAzH2MTHkku0yKU2swcps5HrT06sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUCa2BpeC43ackqghe82CO2tNGdkJmU5LVoKLVRBExvdoffXz
	x/LWNXWBrACvxp9pLR7wpBmOxw4bTZ9TymYm7ahSUQUOb/vRhmpoKgTXJsl9EQP3V77oWkjP3C8
	w
X-Gm-Gg: ASbGncvEvELJvfTdvULkL7TY9TpSKBi8kK3nxsXEl+Axd5lP08XlGUMZIfYW0GSg1/b
	gMv8iZGafuuoQKitbwuVD64YE2ySsoDGbfVJugNoBx4bsICdZklgWA/MaNoIGbGqthMwywknz0U
	/5FXYS8J7tLAAxbGhd2wK2UKTFKxkGdwVPClj5bCRRbs8nswMvAhgXRLnQ/LRPbgk2zKa6y/CFd
	VUZtCOAv+Qm/KG94ASbptcGKyP6hQ1251t/dlMrqnw2KFUogkiWqN9lR+GeiXGpZhpV4TKtztxg
	XywQ931EVD+Sw1NQfo2Tlxo8v5ablj1KKGs0o9FF48TdqLbJX96cL5RJlJfF6rGtWV+g9ivIGKV
	1cD5BDw==
X-Google-Smtp-Source: AGHT+IHh5wVjH6EUlxs4+YZZSHGEjFF9k8cOMxZNtJaJAuOd8RU4IAkF2m0DIXqEyGl4vlUyI3tWrg==
X-Received: by 2002:a05:6512:280b:b0:545:bb6:8e41 with SMTP id 2adb3069b0e04-54838f5b913mr4097064e87.52.1740356339157;
        Sun, 23 Feb 2025 16:18:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cc28sm3301582e87.201.2025.02.23.16.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:18:57 -0800 (PST)
Date: Mon, 24 Feb 2025 02:18:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
Message-ID: <bz3mola5r7v4rs4esmhiticq2ahpkhtwxqnv6nweyfkebszvrp@ap6yn6pvrtww>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:50PM +0100, Luca Weiss wrote:
> Add the necessary supplies and set an appropriete firmware-name for the

Nit: appropriate

> modem and enable it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> index 5611209dbfa41d7834af7903535ed3e05604ba63..31ed26c31e6ea381a8942ccf569513df3300cdeb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> @@ -87,6 +87,14 @@ &lpass {
>  	status = "okay";
>  };
>  
> +&mpss {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
> +			"qcom/msm8953/fairphone/fp3/modem.mbn";

THe comment from the previous patch applies.

> +	pll-supply = <&pm8953_l7>;
> +
> +	status = "okay";
> +};
> +
>  &pm8953_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
