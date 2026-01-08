Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401B202979
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767842895; cv=none; b=eVeqMjeH3/KaMG2BJlU3IN4yEZOsuHLAZs6GITjKtdn3vuWamS1Ucc8Ivpyi3lkDZ6MSbnM2orR2sfBLzvYsGEPuVpk1d2X2i3UY/I4vR3TtogQIqGX13y4fPO/tnI7xxh/h+YvGjcq9kbFCe+vfWVZW1DbptbsHulVc5aI3uqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767842895; c=relaxed/simple;
	bh=VGk454ttZIdzpsHMCIxZieV3Y0Q+sd63A46nmYZNR9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruGeSoyPy0mjE26KYOHmCQ3kTBUcRxFG+rrEexAaG/BUWXujaBXT5qFp4InPVZopxgiu5Bj+/0L6oxcOrpuHu3eaaOkosyMq0UDsEwbEvjNPOMIRiLoPMRkR4vfZl6tRzKYo9y7T4QkvoNrJ88mpa2uRAD/ATX4yOZhy3KHFwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu+/GE6g; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu+/GE6g"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso28566621cf.1
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767842893; x=1768447693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vofKUnypKUICeBkcdQzN2mTABpjUkxfzwfH7Xyfr7fo=;
        b=Cu+/GE6gQ/VWFSZ9sgXaSJoBGq81/pcafRxekyHJO9dCL97P5+wmyQRXqBgvxYfxnP
         q44CdN0zO2/yaPYCJDfXCj14+TW56YghiERkOgU0jnQ92eRqh83O/zeq+AfiEEWpg1dV
         GeoRO0sqx4JrAwpvz9KyDJx46eHY/c4Rauz9QZScu3MklURpASuSvT1a7UBAsa2GW85+
         SoaGH9xWnghMyLRiSqAuz2wJAFC9Gcbh8s12s2T1Gz5+Njjk0JNEGA8fToN+a+yIYY54
         k0NpRzIO0uVPDva8HHznlQFZPUm3S/alDj/TqUsfm2yd/xgXYLRbpWgFSEVkeSBZGayZ
         QICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767842893; x=1768447693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vofKUnypKUICeBkcdQzN2mTABpjUkxfzwfH7Xyfr7fo=;
        b=Ev00U3VcAyucT33g0Zoy4eQiSigpof/xbi9Ivbw6P8x6qpdJp9cQjRMEG+9G3D8Nok
         SVBCe+WzUZa7sZfi3ob5ej5HoMPGSEQYectoszGm1iCHXSYpdlJZ9sXzmRQ4UTjyaY5u
         WHqy5rIfBlyt3mNOinQai/Iz13rmWiRu+10qyLZBzsmgiDsvUKsH0oA67vd+TiiV2AUw
         AwBF5IPtgh1T5n5sdHROXldcfKMuSEzkYnbq5fQVRQM0C8ZXy2jQbR3QLnY0QKS0tKAk
         LMl0htAxCOcGYVAultnspA85b80GANOHr1SvBSUt/s5f4mWXfVCxmqTdemgkVbT6BY3v
         iYCw==
X-Forwarded-Encrypted: i=1; AJvYcCXqYDDEu196NLD6JYvU7VSRnuKPwt/+wg49S4AjlXywF7nW6mZe0AO0gUEkh/Su3CYXknGfm1wrSi++nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcQkbTOpy1SKjU9SvromvIz9fGcwrrPTDe1xHKovrd87MbsND
	5XyZFAPl2L4x1i4Il0rxWwit3ngOCOMNL6u7uDl1kg9xZHpglunw8ob0yZoDMQ==
X-Gm-Gg: AY/fxX5qQz5P0UeyoczlrVxNOcjZY/FIeGPTMM0Q3I0BJAH+EkGykjDjMg5Mu+e4OnQ
	wxe8tcOuunrld7G1S94yUrFRA69o8Hp+/cWqOeI4rUgquMRDNY79v8+Dnf5ZQ64vgs8v2j4INQd
	3DIM4fuf3dMYAdNx2lyWS7EwcQqZq40ms91iO5CMLXd2O5RxBuUKht/WFaDW8XkHvk/4Sa8wXmj
	TFTXV95jfhoDGsL94GhUfjVH/FQ/qSfKIUJWAPqIPitVyV/RX/Cd1/tyEX5ldOavnt2tJVloYX6
	yvHw65bjoP8jeQUT8Li+FgXEtNzx6/hbFhfuUDgCAr6oek7yQXFXJa/stxvoI5XCO+yCNWPapRl
	kTeGG+Xh0SqfX+K2PAe16ej9jF99zgF2I5v0Ew9PerhENgLKIkRtwFS+XBi/i4oRf9jWaeivjcA
	XZnyqdQfeanuBlmA==
X-Google-Smtp-Source: AGHT+IEjSoUYkF14Ssyk5oRE7aJzB2JoaALD5N+ldr3oo6bP0R6LXqMtXCQczf07mSQIpjrUbtFTyQ==
X-Received: by 2002:a05:622a:1811:b0:4ee:213b:3391 with SMTP id d75a77b69052e-4ffb482f716mr64003111cf.20.1767842893142;
        Wed, 07 Jan 2026 19:28:13 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39950sm42659431cf.1.2026.01.07.19.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:28:11 -0800 (PST)
Date: Wed, 7 Jan 2026 22:28:32 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aV8kYJm7nUM3A5jf@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
 <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>

On Wed, Jan 07, 2026 at 08:34:29AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 11:30:41PM -0500, Richard Acayan wrote:
> > A device tree compatible makes it possible for this driver to be used on
> > Open Firmware devices. Initialization of power-managed resources such as
> > the reset GPIO and voltage regulators can be specified in the device
> > tree and handled by the driver. Add support for this so the Pixel 3a can
> > use the driver.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> You did not receive such tag. You cannot construct tags, just because
> of ... what exactly? Why do you think to use this or other email?

I interpret "NAK" as a request to stop working on the patch. I assumed
you wanted this for process reasons, since I didn't specifically address
your review of the reset sequence for 3 revisions (v2-v4). I can't go
back and follow the submission process differently.

Original complaint (https://lore.kernel.org/r/ff9d571a-9b47-4f39-8589-d4c7b190d3bd@kernel.org):

	I already told you this at v1 and you ignored the problem and never
	responded.

	NAK

The path forward is usually to give up, or keep the NAK and hope that
the other maintainers accept the patch anyway. I see 17 cases of the
latter since the kernel started using Git until v6.19-rc1.

> You received only NAK as disagreement of this patch, but I did not allow
> to merge it with my NAK.

Ok, I will remove the Nacked-by in the next revision unless you
communicate that you actually want work on this patch to stop.


