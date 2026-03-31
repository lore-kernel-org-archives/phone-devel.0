Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F331B114
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920446; cv=none; b=uWqeGwx+3fUvT963DAgZo6XC5ry9MAjOR/Mrczc5HMdkQpIdZ+YqoAr2mmAtmFxZ+wK3mwIX1ftW+r7qMkOjyud8tyBtd0XFjBtLNhFWWA7bkuX/FNhMVEwipuiwiCg+CXlaaW7jD1r4LaJm/d5OTnwZHK6VCqzjliR1OlkroMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920446; c=relaxed/simple;
	bh=DoIAKu1bIw6WjuD6GcmqJ8DVq8l3eat3WF9PWpABhgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep2V74MF5CV9RbY26jPoDsXrTnvOjaxBgccM1f4eRyYSuO9EIRLFTr+E5972o6sFayL+JN6tcIX3C8rOBAIWe9ySEq4KimAAS340J3SnIl70+p2WrsD7W8Pn5BdUAxS9u4UGn3LHFHpkZIYDGZmsOrGMjLtSfub/vKJCH/+Ir5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQPIgX3e; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQPIgX3e"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50697d6a69cso27162571cf.2
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 18:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774920444; x=1775525244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0yulhRwyETMpFsHW020W350NiZgzMyyxXfQQBfRWcw=;
        b=OQPIgX3eE3bBYxdpeHII1NQiDfY0MZc/n6fH3Q6EmBgaxJgTiFqsRaMHr8vrEL6lMm
         jrLIlunjodjTmGOZPK6k7mY8QPPJhFEnU6oH93926O9411d30yUo6Xjb2BEKBB+ucCTp
         NdanPoThIjuIDtBsTfHfGJvGw1K7xNZR/jRR/FklJOwBxa6QZeUGOO7DyKY+VeAZTAPR
         IJN4PvhCoMOwiwGdEA9gF2QdTMTZnl/BAUw9CN4rSdYb8GKRWH+V7f67Ozlqz2BfnAvk
         cumDhtWIovMuBApYCDl1IgehBegxf8WYnLCWWT6c4JxcokWqnFyiY/8+wGFi3ss+Nx6i
         5mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774920444; x=1775525244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0yulhRwyETMpFsHW020W350NiZgzMyyxXfQQBfRWcw=;
        b=gZeXZFnbjw4Zsp5zOCjH+LyQLiVGP0E+MtKnBNInQiihhGqAMbkp0dmW18U1aEMxrc
         bjAvVPyP9Td4CDFvACCWeuq7tWlQ4zHkSzre/35XdgryLTiwAvXUumBqOrRucvXrhTrY
         HkEOHcR7pYgbqNEB71ur49KwXYxEnKFriB8JcqlecemxVqrwOxps/i17Tb8Dl4ouM/2j
         kUPYITQp7ihMqC+yt2xTTuYa44d256+dXnK5T80H+pfT4KNtyQM4HK8idY67P5mcZ9X9
         OFBCq9HXWShPBQzxlnKX8MUcwS4oJ3ckG4UXTsZ7Z3oa5wBGSk25PqGnHpokdi+UK8j8
         LEcA==
X-Forwarded-Encrypted: i=1; AJvYcCUKbg/EmEa/hf4j/kBuQfj6kBzENhxJPypIkKjtbjl8LsII/P1dAhg/qZPpESYyNgllBuvyZbgi2MHz5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/TeE97QAvlF9paKZuKfFp4z7ktQddome7fTwfG5HVSRE67pn
	x0XHPOmPqwnsrz1pLMXRXHyvWhBJYDrRHvSh6HvUNy+wv9nZXOU4W0iI
X-Gm-Gg: ATEYQzyr/xChsvI8TbHvDKdKsOKAnBVOV2rw3DDQrlgrShRBcuBg8Stg5g97q5o3BMp
	++npmli7LwamBx5Yowe6SYB9MAbYs69fFolzgUF0XE+G1tm9NTMqNDf/ODRp/a/ovyBl6uHjnIk
	BqOTxR2FB1U+uReupma/toDr8bGyKarJoS+VxSISeJLKfl63BcYmSuN1EfVDGQqtSoT5MleVH0W
	vHC0bJJhC3ah8nSSe9y6Rro83gQ1Be9kMh7o2fPLvS8XsCs5SGEIshTIj5DZHYYLGSGpOquXoSj
	HL3vXOkX6VJfiM22c3PfDKMsquGs83tAg6zD2hGq7BB6YrK8J0sGOiCvD7Q4l+PHPH4y+p2xAoF
	r0i/zUSsJe4rvH+Ll5gaaQ4MH0iPkJL3scP+7xCMxj97zqbGJITGIRe7y2cTPnC8kzKBbr7kHY8
	9wmrxcHVWWBhUOelvGvJvyew0PRg==
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr204956541cf.25.1774920443757;
        Mon, 30 Mar 2026 18:27:23 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb3df388dsm96604781cf.6.2026.03.30.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 18:27:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:27:59 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: David Heidelberg <david@ixit.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acsjH0tZ-jj7N7c5@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
 <acHxgIsyPiQTeqCB@rdacayan>
 <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
 <acJuN_FRqMTGgl8C@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJuN_FRqMTGgl8C@kekkonen.localdomain>

On Tue, Mar 24, 2026 at 12:57:59PM +0200, Sakari Ailus wrote:
> Hi David, Richard,
> 
> On Tue, Mar 24, 2026 at 10:35:24AM +0100, David Heidelberg wrote:
> > 
> > 
> > On 24/03/2026 03:05, Richard Acayan wrote:
> > > On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> > > > On 17/02/2026 01:27, Richard Acayan wrote:
> > > > [...]
> > > > 
> > > > > +&cci_i2c1 {
> > > > > +	camera@1a {
> > > > > +		compatible = "sony,imx355";
> > > > > +		reg = <0x1a>;
> > > > > +
> > > > > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > +
> > > > > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > +		assigned-clock-rates = <19200000>;
> > > > 
> > > > Extract from #sdm670-mainline:erebion.eu discussion:
> > > > The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> > > > driver can operate only with 19.2 MHz.
> > > > 
> > > > I assume it would be worth it mention at least by comment here.
> > > 
> > > This might set the series back because the devicetree isn't meant to be
> > > written for specific software, but it's included in v11 because you
> > > already asked twice.
> > > 
> > 
> > I would say node with lower clock frequency is still much better than
> > nothing or placeholder saying "i2c camera here". Instead we'll have small
> > placeholder that value can be bumped to 24 MHz. Important is this can be
> > easily improved when at least one consumer of the device-tree gains support.
> > 
> > We have very scarce support of cameras on mobile phones in mainline, thus
> > leaving a comment that HW can do 24 MHz is reasonable compromise IMHO.
> 
> The bindings could document the supported frequency range.
> 
> In DTS it may make sense to set the frequency the vendor uses as it may
> affect the link frequencies (albeit I guess they're the same in this
> case?).

Is this review relevant to v11?
