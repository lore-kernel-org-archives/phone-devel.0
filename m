Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DC17B424
	for <phone-devel@vger.kernel.org>; Fri, 21 Jun 2024 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719003742; cv=none; b=dK7mtNEhzaADXyM+UtvIE6JdL3/vut74nzNMSQL0chQ2dzq1NENuorid3D8ZjKJX3dDX6dHeRi5jPYvshU0dgoNXkneeRjphWhZ/NyCi+c/AX3zwAAK+upKq22B15/ix8sq+Dr/bn6B1wfBqo7P6BPkR1Nr85KEReDp7Bmkivqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719003742; c=relaxed/simple;
	bh=j54JWD/2tp28DryNhfjkHMogz6rdh/lUSRKB3jxkBpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBRx1Qc7mY/oQhCYnYf+hC0INb7f4oiINiPXiIaN0uOJVzj0knEjybObyzllYel6OgTx8M9SXxZYiprSwDUVfydy0R4mAM3wPuHAFVfU6jYto+Udh8G+F0/Hy1cQy1zFE2k3AcP8StKiRWipEwHpj6NuAXuw/umOwHYI+cN+pbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwNq7w0T; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwNq7w0T"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so27826351fa.2
        for <phone-devel@vger.kernel.org>; Fri, 21 Jun 2024 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719003739; x=1719608539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wV3zc5+uIc10gjzJbQ0sxc5XsdFKbsu9Jk8PxhMdqEw=;
        b=vwNq7w0Tjdu0Ffe1+CqgW8futqkiMARlXxkcyLWzPjTaygZj+7pIu37AZLKwaZRYrH
         3i3/9uaYStqekq+g/kX8Bi0j0hKUz8sGNY4dvRCbNKK0bomMoc/TqEZbCK6H2UgRhCMt
         WjNe7papY4SB98EjvLNlOP0dULt3kfMFQ9dS25x0g0YvfHjNy3z013hMl8iW7do7ZPAU
         U9r1ukrHLq72L67br8760dW67+mKT9WD0YjH2/kzm5Zoo4y+VTWYiVcW5wGpoFYB14s4
         xMglJogHRlNghWprSKiDS/L+QRo+qgM96wGyl1QP8r8iVHGNaAwh0Ph9It5fL+mNqGuk
         M7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719003739; x=1719608539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV3zc5+uIc10gjzJbQ0sxc5XsdFKbsu9Jk8PxhMdqEw=;
        b=ED0FYY30VIR27IdQ2FHADomjqr+VgoT3Esmo8SkMomTwrbQv94Fc/kGyFcDUaAKpno
         OOCJOelsw7blVRvpGBxH77Ov8Ikq/4YnWougxq8yqW0Jx+QYpLdmUD0d/NDL2JcsW+mS
         g2banYbjXlceOtO0wNF4xrYo6JIM+FlGbaNJUkqbNaOwV4uI2qS/cMIYqjBl+nJyNvLB
         Q2X0Lc3mZKmkyyuTekrX7PFvJivTc9kLjHnE9+QnTFWn1n3uQwEx1JOL9SV0vS74m02i
         WFVIBvrCEAbq5tJKnbnvlZ7kIYsROy4dYOUANzhnIFzSj3vkM+08kk7hi252ZmW7Slux
         rx5w==
X-Forwarded-Encrypted: i=1; AJvYcCW5uMpMFXuUzMFD7KauAN+m6onKV98l7V4++YsEM+Uc6C+AxCSvrOMeGJT5oaAdbNUCnBIwNP0ulebjjnvpqY8a088bQeCGG20O+R4=
X-Gm-Message-State: AOJu0YwXrGam1YFYJ7PbRYjFq1dK8hC1gZfaBxEFwImmsngm/dl+/4Q+
	ORbi0DlltA7CR/xSG6XCosg9m4CyzB++Av0P/ay1JX8Gua4pbxyzWSWQi696IYM=
X-Google-Smtp-Source: AGHT+IG4TWZnduOAOc8KqQQU1wC6JQHxbbkWfneKen4zXyBkG7DG8YoRBYSWmAaoMciOyj4A1w5egw==
X-Received: by 2002:a2e:2416:0:b0:2eb:e137:6584 with SMTP id 38308e7fff4ca-2ec3ce940bamr69698641fa.20.1719003739098;
        Fri, 21 Jun 2024 14:02:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d757fabsm3022631fa.77.2024.06.21.14.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:02:18 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:02:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Configure
 PM8008 regulators
Message-ID: <p4v4msqx6io7mewq3vceb4d5gxcb25whcnuxehzwvfxh6c3dfc@wliip5e43phf>
References: <20240621-fp4-fp5-pm8008-v1-0-dbedcd6f00f1@fairphone.com>
 <20240621-fp4-fp5-pm8008-v1-2-dbedcd6f00f1@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-fp4-fp5-pm8008-v1-2-dbedcd6f00f1@fairphone.com>

On Fri, Jun 21, 2024 at 10:42:31AM GMT, Luca Weiss wrote:
> PM8008 regulators are used for the cameras found on FP5. Configure the
> chip and its voltages.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 105 ++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
