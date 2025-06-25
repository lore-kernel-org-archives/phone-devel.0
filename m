Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167C25A354
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851629; cv=none; b=piPGgeY3nvChifdBbJlSqx/ZJN4RN8bxizjLWBmGtc52w4gjQ8QDG4KkslCtg9I6b0lAc/9ofcyxlEHTVqYom/ORQfyG7zGsbEDooCefsBweTA3rxDBTtjXk58OlDEk9Es3cvNA2RPHVOnhPtQSYjwEiByTWpn8mlD3rD1KQGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851629; c=relaxed/simple;
	bh=DDsaWEyFeHz75TetdwbTXXC5BNl+pjLGrj08BQxMqQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4m69kIzsUIxvyd7yo3lsSncNN0l1wUoCDmgXdLxg6rh+D6mWf62dx/r9MNJKgfwpHqbKHwlbPezWJ62ZUNSWz79NIydw6uR5q7r5qZRUZc15cof/5JP2zM1dmBTDekwL10lw6tLOSm5IFFbAlzH87y/ekqJs7U156MM2fuaZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dr1Y25Xh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dr1Y25Xh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad572ba1347so1048214066b.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851626; x=1751456426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ta2U+QcnogTft9XpE1aWdMlfFtTXMxtf8HD/ZE2i+8=;
        b=Dr1Y25Xh4kLGK9GU252HU3sBWF0eoR3UAXOGdTVYkh8TW/Wa358NEui8zxYj6wheqO
         j2coi9sUpACavpZe8+/uiwLo/fcKhrQ4rqO1UGuuWjgbBCFRphPRHXnQHA/+IsiAUhBt
         XNZe1LgqGjqxUP7Klt8iX3hk0vanKnRTx9C+aGF4LeOpmNHBpSfNIR1oAW6JRrytomUW
         xPyd8GdOiu0wW/03891BW6rvMy9b+wTKooK1xXvcO8uSru02IrAYlsZ+fedjlPubixK6
         75r/hx39rvcP7bSPy3lPu3GINvcB3m1EZni7hOMm7JsMXAdChAkiDKeIdibfZNHVzHtE
         3tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851626; x=1751456426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ta2U+QcnogTft9XpE1aWdMlfFtTXMxtf8HD/ZE2i+8=;
        b=DcNVGFASERQmJxSSr+CbJICRm+FfZYCTfcYjVL2af8TECgigtobrHhcmPvfnlk2pYD
         fGqfMpKENANgH3MKrlfHL+bGyPYnwUeYdhSoi6OkwRaimZif2x0IhqsjLqa118gNROAC
         xyLKYFGDdJ+ZePmpLEuT9YiLPALxgIKhKzbdMgJz+AKPqZs+e+vrP5FPCuReS+M49EOQ
         SfMLkg6KfWPrU5q/TVTFNKoo1yGPcDL4CZU/GWTPbHbJ8DfNU/TUjxQLj4Jnq4lbqZQB
         UxyG2D5WWFlKflARHNVaJq2g5E0emGQjPrREHUv+9UxMtrSbxndHBL936fTJwDE0E48l
         ULLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD6Mv1l/qtMvA+K0eVIprSsZKEW7macH/Abjpdf0sBfwAb2RVWf9aiOLSALL0EZhqxi/LVGjM2sV3dwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/RJA3y09b4WIN6JXlx9Dzos3fcvtHKWgBIN5pWdmNofUoYLc
	x15aU8XboY8QWz4fIZj2zDVgK9NMUzd9dUKGrGPDvv0yj5/61yD767NVjL/DpicjJzA=
X-Gm-Gg: ASbGnctvtOq8oj/AoWnakfz+XmpGPLd7615DJjf9mO7yU1CIL2Krl2jqDNLjTAUjoE5
	u6zfcTMEfrqgbaW9JAEiquiiHkH+qfMmdli+0grWK+GSyOfzVHCovhbutN7zEX0j9EXQmg/J+jC
	u2un2vNQuXW4SS3DHKqU6XAbnsYVQTy8LDtZdM6OdksG+KAFon9Y3kuUyJ9NnT/wCmPhcJaJtad
	sHqD2K3FJC1nPhbCAION5k35JD0P6Nnt2ka53kS44DtBI3Adu1Q2svNXewa9Y/qpRlw73Uf7Is0
	qbie0pT5GTEb+ICkqWCozeO1kja8CE7TPHuf4LieAN0BurYrnbo2gJveRcoeizhRrJg5lA==
X-Google-Smtp-Source: AGHT+IGymkDJa2PepqWKYweFBWWgXgdsKbBJ6SsAwFL8JIz/ma8KQ3iqRebiC+IPQmWTbUJCcGFyWA==
X-Received: by 2002:a17:907:9482:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-ae0bef1b3f1mr265885666b.39.1750851625821;
        Wed, 25 Jun 2025 04:40:25 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b1b1ba3bsm235787566b.93.2025.06.25.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:40:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:40:23 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for PMIV0104
Message-ID: <aFvgJ9euu1RwHXl+@linaro.org>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>

On 25-06-25 11:14:59, Luca Weiss wrote:
> Add support for the eUSB2 repeater found on the PMIV0104. There is no
> default init table for this PMIC, just the board-specific tuning
> parameters are used on top of the default tuning values.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
