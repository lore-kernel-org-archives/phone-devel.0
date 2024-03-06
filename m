Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9005CDE8
	for <phone-devel@vger.kernel.org>; Wed,  6 Mar 2024 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713169; cv=none; b=c6kS6kEmbSIErhw5MX8b4yMEy3yebcuthUEjc4bGHp59v+skuWir2JECUAPqhm6s4QZFkSvAlTp/UrY3wAOB+8VCPAaIDW0JaSbzF2hFE87aT+w4RVIaCZde3zhc2avR/cevP4JEu8xnQy98oCLV72f/Lyf2Z5UI+f2xMAbG1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713169; c=relaxed/simple;
	bh=dnIZwZqxXCXcBxKA9fSsUTi+xcmsYC0FICFHX3lYD/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+CAGKMUjIM8padAsdw0Yg++qRIT4gQsM5m8PF6bQnEt/bm6Wn2eiz0m+1CrIwW0PiQeAkqR0OfIlFKKewT3zZmCSF21t2jI2pJOrQ482ofdySjrKo+cR6i/MeP9CXMA/anRL4OFYyWUONnQfk6/4OCy+Br6/zzpPIpLvb9yuTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlieIIjx; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlieIIjx"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so6975206276.1
        for <phone-devel@vger.kernel.org>; Wed, 06 Mar 2024 00:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713166; x=1710317966; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EoKuwXMEvsZ8GzqAgZzSLOfu2yUWrCyM8WtXmP98Z6I=;
        b=wlieIIjxYtJE4k0vhWD9b2MWzWqtDs5YXzKp7XHDH0wDOcWM6tqzrIY6NlGUqd2pyQ
         AKmc3Yqz+WNCGCIfMDpla/AwZ83X9j4/MYEQTgOQlQwHfpIH3FvFDXpu9985EvGQbOnp
         wXLDezXFYoh2r2TIeM8GUKmkRDkERQIjnTHRooXH20G4oNZd2JNAuBuutr69L4A37teG
         Fxl+c/3a26ICJKHV1ofK7h5JIiKcTBD9TN1rX2yZMAX+8ri3fE4Abmar1953ZzIIT9g7
         4ZuL01auyQyVeO68Bwmep5xgxGm2RmDIT44fW0Y7XezxSQGi0lGg2AKSpii8FyJEMyNV
         oPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713166; x=1710317966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoKuwXMEvsZ8GzqAgZzSLOfu2yUWrCyM8WtXmP98Z6I=;
        b=dowM0Qsmie9Yg0U5s8ZTZ9woqygE5XwCHSld8xjBoX8F8GMlQx/Js8VKAI280xJgiA
         tx828KDPUDwHksi2acKree4gmhL9x+5E7+U10CFS8X4U5+GOBG5mst3jrfRQDkTLP9Ji
         spCkL7Hil9fAkzcmE6mqVzoKpSCOl/k7Z2LMrsVPqm8ILhJ6Gg+V8PoTP7mNso165iwq
         GNyJT7YPLjjBEJ2wWHcQidQF8TtIxxUndwXs5re+ys3L1/7XwGvehpGpzYnXTwXhOWaH
         Heh3xY+5/5h5DZ6z2w9/QH0dMFX5s4Y3rWBEO7t8ApAuSHWNhszD11njcj92l6MmKF5k
         EtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqaWB5PXwwVKfYLq1LdFomWf/ljaImCmOeLNGdfEzH2u3reYzT2a5Cs7m3eJUpuUIIjJ4UL7HQ53IzG28w4VQWEUIdvegrkE9gvLc=
X-Gm-Message-State: AOJu0Yzn38t+bXkLTOIiICwL1n4hFVsp8ZO/E646C5MXpbLcuqYI3Pwq
	VDGXRBvEjVgAwn50s3vhAUBc2h3nDL1ODg/OXz/xpwVqPsW3TnEuacJBjOP6FzuES6IZEYd55Sz
	SjIayR5KJyD7gHlsKXiyl0MHbvaZtbxjG7Y+zLw==
X-Google-Smtp-Source: AGHT+IElFEojtdTOEWHxvLU4AlUsAf4idoItp77LksSXRcXLDan78ssF5m3Ud++5mk9YINDXssdh1ZVmthJv/1gjt0Q=
X-Received: by 2002:a25:bccc:0:b0:dc7:4776:e31 with SMTP id
 l12-20020a25bccc000000b00dc747760e31mr11485475ybm.24.1709713165691; Wed, 06
 Mar 2024 00:19:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz> <20240306-castor-changes-v1-5-2286eaf85fff@z3ntu.xyz>
In-Reply-To: <20240306-castor-changes-v1-5-2286eaf85fff@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 10:19:14 +0200
Message-ID: <CAA8EJprMWbfYuXPi_6e2HjM0W5y7BocLsCUDDu40=xG7eDwK1g@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974pro-castor: Rename wifi node name
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 01:18, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Give the wifi node a generic node name 'wifi'.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
