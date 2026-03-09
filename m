Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E533C51A
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047787; cv=none; b=sDD8E8wkZeRC53FgaX84sZUxrCrKVds9L+cknb8eSwISL3G8nyQKxtYVWWw7HJXEaNAqxZH3bXnEyNgCEt4LN8gdPktgaRgNzPTEx3e07IuBPOyTZCOvKBEZcoc6qA8FSgZFML1x4tb7RjNa7bsZcgrDEHnuFIvyntyFXDYXR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047787; c=relaxed/simple;
	bh=1jGBBfInWcPlyDj77P4+i/0PqZBVJ9PiGxU0GLuAUrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNS34oGc49Le2BWpze+1aYaI0xtgw9CYy+pVwqVzJ1pxffuQrflDRGys20spE++8B25eTKS8zSLjQSyIySMkKrah2f+OD2SAEPGKe4QVAw41WlC36eOzvXkSB8rcpUYh+GYuW/MUU9xMUXNlWvRmWuEpseKUuTKopXJw3H+Owj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iuUL2+r/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iuUL2+r/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48529c325f0so17028185e9.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773047784; x=1773652584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEMYbYJ9NsIB337c5/AE4fq1IEFDMbJNEIOTDlDSI/U=;
        b=iuUL2+r/GRmzHLfudJSe4dxHLMlKmWWcbPVN0mtSinWyx7VBp58eBXB0mPv7GQn6Ja
         ifVHK+mc/sJRqChxEjoa3O5BD+YUtoa6gMp0DDXVusRKCE5q4gAZrrsXNDCfPZpkdN17
         XEl3MWVpktGC6Zrg0XyeIEOve2S+qs/a+EsUvH2G7UwVfJMp3ZIV1+7ASyDLFalkOxLv
         uPCdQCR5+Um6RxPgl+X77rBNu1O7mOttxbmu+8MBIMA36utedhe91zoATDMaAY2BwUGP
         vvY+wt4Jq1j4PCyF6AE1eeiTYzpsGmhTQpD0ULWtzxDq1sDzn21SQiJzhqMElodteUsS
         nYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047784; x=1773652584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEMYbYJ9NsIB337c5/AE4fq1IEFDMbJNEIOTDlDSI/U=;
        b=YwPxgejh+BMRFy47YpvbA+q189hbVrCvhQtQYve28g+t2UgfEgO2Oq1fkczYDOBB65
         Eq8ZQZI24im+78uVh3HfKzO3c8CpiBbYNzj3aQyzs0iK3EhoPR6eYUa56yttOl/EbADO
         hF1s9Dd9qWVtynUqQKDofqodfP8Oo7jHctvuJEL3fHxcoyEEtv37MjCZvxGQdeOZM9Jp
         tpm+SvkeByQ23ZBEDBPxbLB+eko3XQMMOWpCrWxiryEuwvDMrDN7x/gpciS3AEPsP8h1
         I/YseZP00YZ4L7pcyY2rcOp1SPEH4LOkuS7/OuSllog7GAvsv0MGDNCAD4Aj2i3Tt8UI
         PfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNlCNX7GCaL/E05MX6XbKPGbFaXcga2V5jg1Xfqv8JkQUn1OptbVIq2xJWHBeOvBLTq1n6vmxLhe6FHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqo4eqpL3dcKgBlRc+m7ZrCAfqJRoL0pqdHy35FCf5S7BWPlD
	6hbdK5rBL2oEbZYTi6zF0S05/4bLn+3dX0WeR2zPb3vSzCl+LdUvpsiWr2ntqdc/Eps=
X-Gm-Gg: ATEYQzxfPNBDob3Y8nXJ2VP/viNCDQ2ZgURk8gSch64/VkULCSA4ZxL1uN5CXrSI0jf
	ydK0mLM+gs3DadBpVlyxphU5nY01x8J5fGLZ7y2xW6gn+3Mp9efkLExOM6NhbnYrRW1P8VZSbAQ
	Ak8LmpDMQQl9dEMBCr6QSnCTSNf/KEpho+qyIcF0ZN/gh8abJZa3s2OFpMPMp51JMUXzqWGdxR2
	bgnLmbDdC/KOuomJ4HHPhY9ldnHKDPAnWr+7WH1/knaYWQApH13M3tHJRWc3lCvC39SLPWeHRXo
	WaCrPfZAJiT+2JrbD3MCQfjlIupGw9quroIoFULuV5kVSSWdxf80zwSv4IcKMQo9peTsk4KTja8
	kTrnqQ4PmYBfy4PdkNGf7KUiI10JKGZ8VBf8WTeRB9K09otJJ0laABrjXDKM1EbxlfBeycj13Wc
	t+J+RhlHTefUQ4cHCrowFDEpU9ne5d
X-Received: by 2002:a05:600c:888c:b0:485:3812:36da with SMTP id 5b1f17b1804b1-48538123853mr47305545e9.9.1773047784401;
        Mon, 09 Mar 2026 02:16:24 -0700 (PDT)
Received: from linaro.org ([77.64.146.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853616a085sm50557965e9.3.2026.03.09.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:16:23 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:16:18 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: adamp@posteo.de
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aa6P4rE7d2ftaeAw@linaro.org>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>

On Sat, Mar 07, 2026 at 06:23:12PM +0100, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 315 +++++++++++++++++++++
>  2 files changed, 316 insertions(+)
> 
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> new file mode 100644
> index 000000000000..d927bae2b208
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> @@ -0,0 +1,315 @@
> [...]
> +&sound {
> +	audio-routing = "AMIC1", "MIC BIAS Internal1",
> +		"AMIC2", "MIC BIAS Internal2",
> +		"AMIC3", "MIC BIAS Internal1";

Sorry, just noticed this now:

This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
you tested if the secondary microphone works?

Thanks,
Stephan
