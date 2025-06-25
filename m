Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11525C704
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851663; cv=none; b=GWFAg/jfTvCH4hpdOTNaMZnRmlmO5vMxXAtF38S36cnJlq8p/z97CSMdF3sZ5IWDqxkYCXJmiEs+N5zBECYrR7AwhCzRRN30y9rd4Go2f1V2P2tSQRCG2gsMo8j+b4qcWcU+dK+BimJ//9krh5YfCpFDnxQVkJAUcklIX6i2PFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851663; c=relaxed/simple;
	bh=jJJlgaFEJ9g9K6Q8SrNlaqFfTep0VyaYLLhfj8cLj4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzBbtzOgD1GVaEhP41Tyf9mw48ZIXatX5EP0TGnXUac+VFWMtqtvULE7JAIVmM/9QlesHVP/AuwrgBj9MgBNgx0hF2r29WtvPSiAS6qGddhKAMyYi6UDdJ4y/m+SDyZ6WOycaRf+HjUlZp2Y1RvxCFQRYH7GzuibMz2UtEEqylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4gy6egH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4gy6egH"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso171913066b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851660; x=1751456460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dG7kxxjRLtrO7B9/s+bXTu7SCYb/AqhokTFr9duMWFo=;
        b=e4gy6egH+LiY5h7RVXdwd3u409F+zYI1f+AvOgELDFBGaLEsfQy0rrdcSrO/frS1kq
         pDfZstmLHf6fc3fgZR7DAOZZOX9PgR+AQybJbsxSEa+Sh8RJTXX6zoirERV6NAqZnUOA
         9ZvRlgKLvWquE9MlKb5Axc6fJnBaxN+uw8zwaunT8AuMfhubz2ClQ3uOCI4IvFEwkNsv
         qHheN+Qsij2lxy4GBnSxjnav86I0kyr5XuQMkg2OVgMkLOeY5RAVz1o1XROPQw7jS/t+
         DvTjst0cYJgzerIsBOkCX6jhWeuj2tj5mJ8tTJK9yoHEnStJgzwWYobSU0RSbYDuBuBl
         16ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851660; x=1751456460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dG7kxxjRLtrO7B9/s+bXTu7SCYb/AqhokTFr9duMWFo=;
        b=F/Z6/x23i6ncNigXsCEUqHTY+8haks4XoIVDpkbG3uhOXoFLTUuCoYt+78fZvFjPEB
         hzl52lJA3DGC5JTm77c0EfAO6Oz+GlvGOyxMC/GD270Mg186pqkHOo5c6OtN+GJq1PDs
         zDKOqWK1HgecjuYs2FQRMva4c65ghjP1F09g3QxNmrqlh0mdPuGP3rfmFKSz0Ttzx8ew
         t7U8CTTL9v+Fg4FHG91wBvN5iVKmmSPiFfFlEL1/z2QFdO7zYD+Ryw5yKh0dwmEzI5QG
         OPBFQFslN3RT8AAMVl5Xiakq2Wotf5xsy5WLBcAvtY0U9Mf17m6671eOSEJkpC3KgNdV
         Y2vg==
X-Forwarded-Encrypted: i=1; AJvYcCVxBnWTlkrRJ8Jsab6lPbYLJwV1EPvy1dAuqzQ0jnB0TeYagrKS2tv+fBWI7Tgh0l8HHPbLM2iza4WMJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2UMab42MkKR2pw7z480Yqj5xEyNNMp0nBC5X96+Txwkk1AJES
	e2wm9z0pthSS8dvSq9pilqJbUdtXfX1hR+e4YhdHEwGzsV8nYwW13HdZ9gB3RudQJ+k=
X-Gm-Gg: ASbGncu0I2HGbXgJLHm/8ghDtUUN+gkxU+iYZ/q543rDKWNsVPO5i6N8T1LJL4JySXG
	xMjU3EXke+VLZMkZadhgieoERAxCHhIrkRdCGHgBBxzNliIp92ync1O1caI8bpuL/vQpRRgutVu
	IaXp1GS8m6FOqKDbgqtWIb1DI5kKW0zVqIH5NWzOWB0dcRixQAvDpO0RHE58HSVMTERHrO7b1mM
	LGrXR4VzJhiJRF6FpX0Ax7G74XwZp3WgavqZZVPsSoAAurJSFaVAuEVUaPoVSX7+g7/Jx0QOn1r
	34p1Vcc4ye0SR2KfRCdmaaPVNxLb9xhGGgN1mIU0e9rg7dMIWoaIsGLMVmc=
X-Google-Smtp-Source: AGHT+IFpDm4RRxvmymupPNfGTqlfEfo8Mbg7duMyL1/t+lekqFEkI+Q3G0VP+nEz3h7kTBtla3r67g==
X-Received: by 2002:a17:906:6a0e:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ae0a7473535mr648229366b.27.1750851660394;
        Wed, 25 Jun 2025 04:41:00 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b618251bsm197805866b.55.2025.06.25.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:40:59 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:40:58 +0300
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
Subject: Re: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Message-ID: <aFvgSjkCNueASD7D@linaro.org>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>

On 25-06-25 11:14:57, Luca Weiss wrote:
> Support reading the FS Differential TX Output Resistance Tuning from
> devicetree and writing the register, as required on some boards.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
