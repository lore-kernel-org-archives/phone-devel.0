Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D25B5AB
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642603; cv=none; b=JLqQFRJUglPq45Kw1Co3wSYqW4Thcygo2KHFLyvtXS0N174rAZbOnQqKNtCcwPfdnpPZjV8CHKDKXlU2ikUXxeUfWP5LC6PkbijbmpbzlG0NnDCcG/zRmzSKZNxjIlil8cxknzDXLUMxyfDzdCAge/cbqm4ZRUmGfVhNA8ymqTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642603; c=relaxed/simple;
	bh=6ca1Sl8ati4GIMbwjPj+oVMEy+QZ4KssuHKcXxijejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUTYkbqzZVcqD1gJaUa1NDVv97dfqeMKD5MyUiat6YhBD6zC/YldI9qSBafj0Cse69D+gZ8nfovKGrLTpa8/3wW+qACgNsVZev9T0ZuQISjqYpiBTVfcl9YN1NpVy7s1YemNxOeG3tEhfA1wSVmeA0H+XpSQDe1fJy8rs3ZjCSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K90z6qwu; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K90z6qwu"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-894774491deso5144146d6.2
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 15:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769642601; x=1770247401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/R+p0Q89VOTzs/CkCyEL3M6uPrfEJ5bMsqI/Cf8cMcA=;
        b=K90z6qwuK+1/Xnm39ywbGMTfqcD+S7ZsH0SnB+CLJpInQddrut702wGJ0kMCG5fDXW
         5nSGTj993iMthvMjzahsmtk1Z16YMQTUJDerRE/mKT7ClwzPPkGi1i0C+xOtkR9PFXCN
         wS/c5jb59jkMWvDYlwvByHDc5CoEPprWg3Q1TfFrHMk7Ey1vK7+ZtGMLNWP9IrdMIESx
         Ld7Hw4Q20cF6WM7I47395kLR0WfIVEkzszvlwhQPFAfAxh0o0r5/hmr0q9vGsIBeC591
         j8DlygFXIqTElL+qv+w2fkfLzCKijzdihWj/qTJr2jW+ILtid+NK2R915riiODEIWG1+
         Al8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769642601; x=1770247401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R+p0Q89VOTzs/CkCyEL3M6uPrfEJ5bMsqI/Cf8cMcA=;
        b=S2IbuOCPIrqaOheYMc6Alt7ZKsTI3eYEw822k4V/1keMYm9H/cJVX/CZCGts9ZFDYy
         IfiibEV5TQPeNLHY6HEqsXnQOgzNoci/WfALbxarR3/IRPITgI8+VL/AIPpknSEBXJY8
         RGHa/0rjjkVge6pRSZd99GcJBwH63pnzqx/f2E5pjBktkKMGabeLUg5l226+A9eNyGlb
         /6rZSpNfnZfeJpwzfo6CLzh3jxGjvFxk1B5K9WpUcegpejs+DnsAZoKjQtP511DDSeFm
         PALdvUhb98FXZnj/OW2Z4bXKw09vJCKzne8NWfzXEuPZ0X1RVFwyO3dgF0vmwGrrmWkb
         oyFw==
X-Forwarded-Encrypted: i=1; AJvYcCWkgKynfobzb+DrAIyqV+FBEaKH98KZchDLIfepvLItBbouHDh3bM7JBhyh2oDyAOi6a7qBQPnLRhWHLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YBUQuhLPZPn78MxZ33JuD4t2temxLVv05xRhqHMElhsidjb9
	32I5CNo1zeEFmv9VoyaZBxtnimGgxHgLX+mhwXNreMMtOQUVhpA8SMYP
X-Gm-Gg: AZuq6aJ0kZIuHFcyhHxUE2e+ZtHeGs39DCCSqvw4S23de9OHQvtGqsvq6dh4kc7XlmX
	Puufk4aYJzYAPwugn4h2Il3zQccpXDnnkF5ancgQe3SdeFURZ99D1dxKTUUrXoM/Sr2FpXE+oS/
	dpQ4upzRR0eHrL+42L+lYLht0OMx8GMQ5rgQOWm7pu9QSmPL++lycRfJxVOGbM52jlUh8YpLROM
	ZGGn+x6Pd7ZPZaB3ZY86ShkhHZ35/5CVlrJTEmG26v0IsyYS2niaOvWuz0kVyIl0qmJjD/8iP0W
	0vNxG9lWaxwgIFiMS+C3fLazKOKi/elAKCER9qH8ulBGqFvtbpCo+/82SWwP7TS1di9O8eQxpYH
	LaYg+dZlcuTPf+aRJ6VVIkQxMIMOgpDgalDlKmL0CNuSlzOfaXyRtoFB5XDSGE9s9C6iuXaqaKo
	PF7jd6G9WczhgA6A==
X-Received: by 2002:a05:620a:25d4:b0:8c6:d2ca:1d0e with SMTP id af79cd13be357-8c70b84a6fcmr916954085a.11.1769642600692;
        Wed, 28 Jan 2026 15:23:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375b640sm26715056d6.39.2026.01.28.15.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 15:23:19 -0800 (PST)
Date: Wed, 28 Jan 2026 18:23:43 -0500
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
Message-ID: <aXqaf4OmvSCvt5gu@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
 <aXl6MpRB9ncCeu2M@rdacayan>
 <aXnB2FUgb5OlGjfn@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXnB2FUgb5OlGjfn@kekkonen.localdomain>

On Wed, Jan 28, 2026 at 09:59:20AM +0200, Sakari Ailus wrote:
> On Tue, Jan 27, 2026 at 09:53:38PM -0500, Richard Acayan wrote:
> > On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> > > Hi Bryan, others,
> > > 
> > > On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > > > I think reset should be asserted before regulators and power are switched
> > > > on. i.e. before you try to switch the chip on, you should establish that the
> > > > reset pin is in the state that the timing diagram calls for.
> > > 
> > > Indeed.
> > 
> > I think the discussion is more about whether there should be an assert
> > in the same function as the de-assert.
> > 
> > > The xshutdown pin, as it is typically called labelled as "reset" in this
> > > case, functions as both hardware reset and hardware standby mode control.
> > > It should be asserted (i.e. be set to low level) whenever the sensor is
> > > expected to be powered off. Typically deasserting it is the last step in
> > > the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> > > (parallel) camera sensors. (There are some exceptions that use explicitly
> > > two GPIOs for similar functions but there are very few of them.)
> > 
> > This patch has the reset asserted by the time it gets to
> > imx355_power_on():
> > 
> > - when coming from runtime PM, the suspend callback asserted it
> > - when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
> >   active-low also affects the initial output setting)
> > 
> > Should it be asserted again inside the function, or
> > should the initial `gpiod_set_value_cansleep()` be removed?
> 
> Please remove it as requested.

Ok, I will remove it.
