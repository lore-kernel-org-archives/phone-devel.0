Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFA257851
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 19:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381384; cv=none; b=jO/gUGAfgPBAT6sYFmAdW1mO83RA7W4819kQG9b2JyecCV94ZAaChj5x6jNibarWMiMocYDn9ST1zJk4uFkG8RkIDjvr9fM3/Hyg+96EaJquNppycWjDVWSqM3/DAaMjhCeF32bDtGl+fNUVtRmHRWZVy1ROoCgjj+y5k9KJMyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381384; c=relaxed/simple;
	bh=fBN0MhDEFUzS0U6dx0FqrazYoqTXsoKeLlxeDkI4A7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWxqU/zbj7Mm9XCmvu5MKCt38+MztC1LxqspqCBXz7X8V6sWBGmQHpgdhom6yFtjIhNbgkx7E3SVJ4U5IaWM10S0Ae3AX0TyEpnDmWkCdyUmaitOAbSuNmXp34LJobvAq7a2OidiEP8jmnCQMCG0izO8/67lmjdjQgcMpH2kdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE3rHcpL; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE3rHcpL"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2954234eec.1
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774381382; x=1774986182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvwht5JE6diwBV/hO3ygWTczq8GqXSLEKFpamj447+8=;
        b=UE3rHcpLU0+qHMbhos9VfKS3kSoqR/kYe5GcJ6XRbUxzRcMLZovttLpQqZlAoxJQFC
         QUtVoMk9tu3NbMpWKLGucNoygxAfBr8XNNtjJ24RbS+/iWLJSGEmct41xcZ9Rg/EpuJz
         l2onHdf0j7Zo9gBEcNdp171l6IGr5pISs04BjnGYElMgABNtG18YxKYcmx4CYE3+D908
         asBZjqEeJCjYSfI0EnfripapYmRpzUMn/WAYKszW6ngqoD4aunRHRgLbrViUsgGMqi/l
         eKuAac7cn1a7CJ/IFgyJO8fqq6d7xrt+rhB3B+2yfhz5Tiry5aDujSppn9CbKIOhbBBR
         J5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774381382; x=1774986182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvwht5JE6diwBV/hO3ygWTczq8GqXSLEKFpamj447+8=;
        b=M238IDDKuHjPKdDAdZVxkL567OXBZv6PbDuFWh/ifaY0k1tEUdM3+5uZdNyow+ZZHW
         LxEtlouE+vdN1K+D4wst9Mw2cWHqlU9eKa8HKYjRIIT4+4R0bgbZLHG3Y5Nje5q5FHUB
         8RefuiJatfAYdsewuUeGJXa9JvD2VbmNuXWrAohKga8Fn3xuhJ+Ab6V28ocPuVMRukee
         a664XocXNANcMsjJY2aeWgfELN1hkH5OnyU+WA87asOqc0/iH6kD2dO8gsvLBDpv1/qE
         qKJh09f99IosmFlNFq3j01Kg7i9aCmwRvWIkFnJFGNrT6Zn0g6rtFBB6+0KCHW+/uahp
         73xA==
X-Forwarded-Encrypted: i=1; AJvYcCXCCZLodClRKa9t/ukT8SEYKonB06kbIgIVrF5iHvLq+7TLx2nuBY81JFGs/czz+kQqFcuv7f0qLgFEDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbssUcCCSTTMVA1RRpeSUeDIUpQFq13Lo98Nv7bec2ac7gB+K
	L1gysXnx+ZELlTUmGdVM8csvosVB38XwdFtzgN8HBaCh26uxqoeOOu9n
X-Gm-Gg: ATEYQzzmVcYrFouCm8/1KHubg3VAvaU/P7pNT0se0XHYr/R3XvEIDoRb9g40MUusO58
	dIwUDlia2ZfGpsMh9BVf1kny2hsfX71Qvh+OubdOKwss1yRnZeoRRc2GiTUebZil2YMUsntg/EX
	OKfVh11G0vQo7gJ1ab2hFph1DUPO/q6FzB/47b3iUAWHWGnPyCC2Xx7lcy6g8aZovvzKcHdHlBX
	lsifj6gdZzpbb6XvQBUACza/kLencCaaz7YJF2Ye+azXpI37zkUFLRAQpLA4wi3L6G3iUgYuo3H
	A3Tc5xD6jhYdol0muJPeDucNMaOHP7Hayy/Sj252r16o7kG1X5sI1SaZF/2FWcYDhDwgD7KBm/Y
	GVLkVHVI15RqL1PJ7NJvlv4ut0SQdeERqX+RFMOJcwxB0uh3LC8wAOqdaL7+Krd974B3eSsaum1
	QozFbuS0lGkJRCC1dPS66uYdeCyq9Cez5IDsUF5dJ7xEt4h2K/sLTz8G1qE4kXT6BkDxCzh3xes
	WU=
X-Received: by 2002:a05:7301:1984:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c15d322c28mr340452eec.13.1774381381746;
        Tue, 24 Mar 2026 12:43:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm2915342eec.2.2026.03.24.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:43:00 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:42:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Casey Connolly <casey.connolly@linaro.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Message-ID: <acLpBXc9Qi5riQO0@google.com>
References: <20260324-synaptics-rmi4-v8-0-2168d2df68f5@ixit.cz>
 <20260324-synaptics-rmi4-v8-1-2168d2df68f5@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-synaptics-rmi4-v8-1-2168d2df68f5@ixit.cz>

On Tue, Mar 24, 2026 at 08:40:34PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly irrelevant for authentic Synaptics touchscreens, but very important
> for applying workarounds to cheap TS knockoffs.
> 
> These knockoffs work well with the downstream driver, and since the user
> has no way to distinguish them, later in this patch set, we introduce
> workarounds to ensure they function as well as possible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> index 8685ef4481f4a..fb4804ac3544d 100644
> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> @@ -18,9 +18,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - syna,rmi4-i2c
> -      - syna,rmi4-spi
> +    oneOf:
> +      - enum:
> +          - syna,rmi4-i2c
> +          - syna,rmi4-spi
> +      - items:
> +          - enum:
> +              - syna,rmi4-s3706b  # OnePlus 6/6T

I thought that all the workarounds will be keyed off this new
compatible, but I do not see that. What am I missing?

Thanks.

-- 
Dmitry
