Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DA133506C
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 03:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768881022; cv=none; b=nXbAPLGXlI/0A1QX+4vftuvf+4E4SgKhg48uffueTXlcqg62bga/HSrkvW+oyNLap6UCnk5kdW+4EawVzxdfih86S3s4qDutuHlolBN3/6jFbf8wr/vvJI9rDt1qMrsoqwXoa5TjFJ8kLThNGJ6wkmwKln6xb1F1AoX50r/1s1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768881022; c=relaxed/simple;
	bh=YouqfwVWzYXpcikOlfu9sTS3gDOn1ZFujhD3ULTm95g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cER+Zpa/5E9KCJ/qgwVhxpfMISOXFc02R+1i9K9pK+HORyCGo9vUQZggydmna4WW5PjATSQJbdEGzx3TXGGrjxAjEXus9stnaES9cLbjr+rOznIAWF9wt6ZNDnWMeJil3TVE0V6WoTPVWg7rCw4As9YrRS1vPbiz4Cm+GxlfKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmqhouTb; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmqhouTb"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c533228383so298078985a.3
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 19:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768881020; x=1769485820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0ylyK0Iu22RJ/xkcdGlRObGYO0FeHTfl507VqBaAx4=;
        b=ZmqhouTbwST4ddALMVWqWYXrD6SOgQJIASZXcp1vBD6BF+Zo55rXjoSNVULPX/aRUW
         ur9RsyoFLFnJ6IMDWoqqNtsRoLyCqppfLbCN8/CR4nkAyXRqFlfP9OHMcxp9pm8FaKRI
         NYcwVFQ4jagrD5FgIYl/XzZKnbl3Wic0TpoI1ow0pjv9PA04fsQ8uuiePnWSlvfeGx+m
         r3apki+c9emFM70Q++iVoS2lyRHcMo4Wji42O7/5C3eyQ9mdC7TDLksftz4wFGgcqauk
         Ceczqnr/IlqyLmvKDN8Hj7H1NnXphNcPnq5zRf4rkbHVZOPqwDlgD7bhijGExMXJhnbd
         oqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768881020; x=1769485820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0ylyK0Iu22RJ/xkcdGlRObGYO0FeHTfl507VqBaAx4=;
        b=RSZxqgZnnxugb08fVMbZ9NA0UgZ9EeBLFLzPYtTSnfQgEA7EkKaQvPSZ/2CzSBekSc
         g8IxMPLDLsrWsfzykuPptCJJ0IObZZatDm4aNL6w6IG3CJkzdoWdlsEwxI2iu3i98iGs
         9jyzfct6Yi8XnvUmEORjUUQO7A1wkqD1QtGopXNMgo9SKk0TWIsgKpTRE9eDGDjBlOwW
         xN6c9amg8Q3c7f8ru9m+5guP/D8Cm4SK1JLIpUdTACPpxlsTrduzt4TeNQBDnNHkjuud
         2wscr6FoYLbzE3snYZpsWScYNdIyKYR4EPK2DCbt4WmK7LeseZIA8jLuVGLqQtemTHzf
         8KcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi6xK7kR8yGsPry0CH9mqQSaFW/oqwRKUklh0YbZN+UgqhIp1YiCXKs2uKZfbLDMcw/WY006QsSiUN+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxR8QjPtOhDMJU3K+ZcUAPoZDiOV428Gd5prFrM/+ehlNhCntB
	X/2Ml7ANyufcweeFsqgsV7ta4qicZfunaF6sEELIA3TWdJ8Sm2UseRgRGRTE4Q==
X-Gm-Gg: AY/fxX40d6rRTw6+nQx7i5x7pJ/VD1tdcxgA0mR83s8FrcCbDge+bQshXgkFKjFIxdA
	mU0/MmtUKYDk1bVmbL4CJGnQXMCAxAiDl1RjdiDUxuI2i6WQMqpDi7wXh0w5Qkr3nURAexnl5JZ
	eZHVNFc0v7L44fe2rgQUtBrVX5Z5E1qJ/xyaBVBC2FlMD8TVTOfrAIOkjw1KQD4jJczN0mAMKqE
	LcrANibQsGTenJrrwre4SsjHgSpBcyZuTCuIHkHuxR0w33mz7vhopW69G4v02O3bUIXwOt0iTbG
	rM2n8nLCpLfFsWgW3bh6Ny6dyCCrNRrjbN9oK/8tmVNfWTUsCwOaOyTUzRXYpwGKBqvvnLEleKx
	JrOA5wAzvvcit3E/+iM02N9E4erghz7OrO6EdXm3ERrpM2IRnJl6/CzwI2SAw+XMu+ehAMY6i+w
	qynE2QV2l3pSt7l7eSeePujiEs
X-Received: by 2002:a05:620a:3f97:b0:8b2:2607:83d5 with SMTP id af79cd13be357-8c6ccf2381fmr56720685a.75.1768881019642;
        Mon, 19 Jan 2026 19:50:19 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7250a60sm936184085a.31.2026.01.19.19.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 19:50:19 -0800 (PST)
Date: Mon, 19 Jan 2026 22:50:41 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aW77kXzBjAlIMG1C@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <a29ff1e4-117c-4703-b0c7-73ad4e369201@linaro.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a29ff1e4-117c-4703-b0c7-73ad4e369201@linaro.org>

On Sat, Jan 17, 2026 at 02:03:02PM +0200, Vladimir Zapolskiy wrote:
> On 1/17/26 06:06, Richard Acayan wrote:
(snip)
> > +static int imx355_power_on(struct device *dev)
> > +{
> > +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct imx355 *imx355 = to_imx355(sd);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(imx355->clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
> > +				    imx355->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> > +		goto error_disable_clocks;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> > +	usleep_range(1000, 2000);
> 
> The deassert above is not needed IMO, anyway.

This assert is for clarity, otherwise it isn't obvious that the GPIO is
asserted low when the function is called. It should stay.
