Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC862BE7BA
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568796; cv=none; b=N/Smr3rjBb4liMWc0uh9iemX+T5PAzgjaNqfk4MpmNZmLt5b4Ez58deHmlS1BuZGG+H7c1Dg431vS5OnRfN71Thj/pdNRi9KJlvPFTgRXE82tat1Nr01QB3FuR30usA3Pz7n1z/wH4RUQN2tN71Dke2dTJCBRTQT2QeZA26FIdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568796; c=relaxed/simple;
	bh=9KL0qFGhdBvOIIw6GVscMMDXp1h7L+qs/1b2H49sp40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GenfbRfxD593LN7qMahgbjVyZ4dkOqgALQbipoxusyMMrP1+QIVTD+M3mitjUueK9JGB0H1DdA41lP4quy3yeH52tRv910HzsbMh1DOjH4LbBaHQEJj9k80oY5nAS2VIHMdekMwxGNDGRSCesk/iFn5zcoEZh7kgzC75JBKy4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiIQOE+W; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiIQOE+W"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89476eaaf16so64432976d6.1
        for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769568794; x=1770173594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yluvfUNr6pH7GOU/s+jQXcqg7WVVoVQL2cZIk1rM12A=;
        b=SiIQOE+WNstIDMT5YlVCQsJtZWphJZJr3NdEDMdV5NDb67FflCWbfmi3VIVT0kk6ut
         Eqvh/niJq2sI0m/kI7RTwI5BZC9UZIq6s50meT0FW+1yG0LTGneqVw71RkKu2BH2L4OB
         uAdj0yV5PMH47KKYtVJZid4JEn/6KRfjQt8tWwF/ufLdmqQqAgUXOgkzCoMEdFoEUTk8
         tqlCWumtPztW5G/VJ6/2OdX/qUhpIsUFVtFjDQ+KAhc+rfUPFLpKr6IvGmxCsK8TTZbW
         riyZr8g0rDrhdE11+KTpoiCHOwkbxmeBXDglcBQKaGzWiTVtBM+a/TyVL0rClf2Plb27
         oK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769568794; x=1770173594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yluvfUNr6pH7GOU/s+jQXcqg7WVVoVQL2cZIk1rM12A=;
        b=NEt42PobGc9mA05x3i2jC3Z225Th2U+4uEDlRaTlSjW7dJlGXHq+v4viW44LNmAQ7I
         q3dSxukBzHWWZ7LrISZ8sKaYg9gTy53cxp2Xts6yux5AnojmlsIzSPvIZpHnqKl7/CBM
         fz1EbbMGOxlH653NcGpb2ftFqdgwUjkzUzx9fhEtgx/GhWzSe1CWIuGqP04CpbtJXhAY
         L2MlH0V32g0vgUuvP9W+PuGmxcObydatTYxPqs6fcnJGNs6LMns+HtGQvwCjtM2pjTtQ
         5EZqDRBXFGPJmNlrvrtFe9ZT2pw6dDCKeSnPKA4RYJHa/HX5n1a1arZOlvpBpFeoAN7N
         0IpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpQFndTg4Ag4A8mxFfwe9wOFwkZhPjFsmy1rnNU7TrjiYghOsi2GmGd5RD0rm1hvx7Hthy37jqnvxAjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydivoTOsjz3DhbpsaWGCX9F3GAgznYuB2u097vtfftkYC9jq6l
	uoIPbqHQMPkFLetZFP4/nYcejQwb4BgTHQcxe7oE06OXo45+R21nOasU
X-Gm-Gg: AZuq6aKPQ85f2IkplWEyCAYTpyZUtGa02GhWcKbYDoazHgxT9btiyj+xbusvi2CT18J
	PlgpEij+pG0RDlz0Nq0RSCFglL6TJmyv94gSAuKAu0wZXEfgUQa+jtUgJheVlYSRrptWGNAQgi0
	xp92zz3UtgUKgRn8zGPq85uuzYAds5j79DASY8hEqzZJLzzyqTRpYjvQ28fBOiHLx9jl9nvpwGm
	7oZRJYs/tjNxT59X3RnTCW7+/jg78B3BiDj8qgRWexeU/UbBjnL+wqm6hfnXSwV4j7i58MLxWSG
	wJcBTMDNsMgV/2W4e7+YEJ7DRd+g+8+SFabP+GcZJRvpMXGLvt1LsWOX8MuSV0AVlk/LHR7VX0i
	eYsiL6HRyaY+hrVuXaSCkOSG7CdCw9mwGCPejFdk0aKGlvl4P2q+G1iBzZfIVCCLsmNlGJpyvd3
	nhKcajhZJfht8uMQ==
X-Received: by 2002:a05:6214:da5:b0:894:6e5d:eb8d with SMTP id 6a1803df08f44-894cc8c977dmr49820206d6.34.1769568794147;
        Tue, 27 Jan 2026 18:53:14 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375ed92sm8696686d6.44.2026.01.27.18.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 18:53:13 -0800 (PST)
Date: Tue, 27 Jan 2026 21:53:38 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aXl6MpRB9ncCeu2M@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-V8VTcOICLWqaU@kekkonen.localdomain>

On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> Hi Bryan, others,
> 
> On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > I think reset should be asserted before regulators and power are switched
> > on. i.e. before you try to switch the chip on, you should establish that the
> > reset pin is in the state that the timing diagram calls for.
> 
> Indeed.

I think the discussion is more about whether there should be an assert
in the same function as the de-assert.

> The xshutdown pin, as it is typically called labelled as "reset" in this
> case, functions as both hardware reset and hardware standby mode control.
> It should be asserted (i.e. be set to low level) whenever the sensor is
> expected to be powered off. Typically deasserting it is the last step in
> the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> (parallel) camera sensors. (There are some exceptions that use explicitly
> two GPIOs for similar functions but there are very few of them.)

This patch has the reset asserted by the time it gets to
imx355_power_on():

- when coming from runtime PM, the suspend callback asserted it
- when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
  active-low also affects the initial output setting)

Should it be asserted again inside the function, or
should the initial `gpiod_set_value_cansleep()` be removed?
