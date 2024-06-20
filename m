Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846D5820E
	for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916112; cv=none; b=gWc1pqqGsgi7RTX9+T709HdGvVoihUGgC4tj40XEs3tPPRPog+qnhbSnqIPfgOOF0rw3UQbrJmA6ULltThbmFzao3b5fq081Oem47Ui5d34jMgPKLazFhNPC/nHTo/Sdu4b3q0ga+oLAPp7OUgc/bof+sO/2FA7lCLDtyem5Irg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916112; c=relaxed/simple;
	bh=jCRPeDhRTexacpaLMCQOVq+EqZtjNasVzgQEbK1/75s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IImXoVvJ5AH1m3TlX8yzbubrwn7oe7InZiBDlQSzQZ9I2oEMXrpK7ly00DTTaNcs8hp5A8yttb9gLhJoo1z5CyMpCr9PAC5HC5MfNJyksuxP6kqH3Qdpm9f0FCvytbM2Ph9EV31tIYSZcD+0p/le8L+LSY5tGrPgQQ+oNW0IbFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWxnl3/l; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWxnl3/l"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso1387173e87.0
        for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916109; x=1719520909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LV42KA4YMDhuTQbvBLdefHeipONZ+HZ8OMMqsUM/p24=;
        b=CWxnl3/lxP1H9NpJ07ZVp+ldCK5RkJ96WOsLeEtNkNDVMYeTapmo5C8hT+GT//89r+
         ipj8+hEN9PV7eaaCzbM4+SEiqeYaVwptpnrZT+290RySpWSk+OKhVVBnodIsn03G0T2H
         QftO7aD+pP2yr2C1KPj2vLnsiD+npRpoTBam6CZx+o6ltbnLUF5EAdEuvv/QO78A86th
         79rg6tiptD3+wf/kM1654k3fhr+/OsTYGmYAE0hRPgOznE/8V8C78k5rVPLejXj85vZi
         Em4CGrU9g8ys96o49Cla0dKNTDp795Acaziof/cucJUmApbnkja9TLWX8KJpss2xrj3M
         MwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916109; x=1719520909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV42KA4YMDhuTQbvBLdefHeipONZ+HZ8OMMqsUM/p24=;
        b=W2oFhC3dIgxRLRZSCv/NbJhRXwzgoOGGBQz5QOzg5yOnaxQXrjBaXlT9Vys/1Z/Tid
         H2JPilygAOsjZZ10i6ikZFf1p8BntR4SBE+ZL3Wdc6VpLvSnS8inu04XGN29WeBTDNrT
         Dia/FtD8CugmuRjF05l9fUJBI0W7FSoIzI3UtMLZROVpcp5/kGP9z1/5dgg0YcrN9V1p
         QTkbrh0zcd6tmaiDZmQCpXORp9I7tCOwqQKwcvPLo0bzauSSKJTpXMCXRq2IZ4FsRtqr
         rupJjzCxbion3eYrQqoBiYx6nueA1Pjwofaoi4x/2+IQrY2nIIOlNKVWz4SIMDZzzqrW
         dd0w==
X-Forwarded-Encrypted: i=1; AJvYcCUOYSGQjuT9PYCAU5jER7xYzsBr2b/IMA8FJyFoxLo8eUQzeHEXSAqZvxKydV80iW1WsPFGFUczh3lSUVICv4PX9Y+boF7qp9ZIZJc=
X-Gm-Message-State: AOJu0YzAnVpeus8UNqVLosenuKu8vgKFlXgu0UzLKxC+Hncl6G0zZK28
	G3v2LYbIR8tgAtaY/xH7Mjy3MblUwkyCEOKrDgnKysRgvmDzbvoAANFhTiOVdkM=
X-Google-Smtp-Source: AGHT+IHRtv8ZxR7EYsMMf0CjZ2uGMGxflB30i6/Yb/bOaNtWDIKRz1l20HzQlyZfncdMDFY59vj67g==
X-Received: by 2002:a05:6512:3ba3:b0:52c:9c8b:f89f with SMTP id 2adb3069b0e04-52ccaa54b83mr4595217e87.48.1718916108756;
        Thu, 20 Jun 2024 13:41:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282efe1sm2155501e87.76.2024.06.20.13.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:41:48 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:41:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8939: Use mboxes in smsm node
Message-ID: <rl3jfufx6tegdt2ff3n6lveqvlqs76lypeegu2l3u4lupcfxcm@jlzxny4fmsns>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-3-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-3-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:29PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
