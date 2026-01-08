Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1728689B
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 04:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767845690; cv=none; b=VbXUkbTuomccevNkjpVraOehJfMUbrOg5VfvarKTgyRaokX1vl3tYB1m7Y4vpgIXdvmkIp9b1efCdMO2HNrjwvB46abt7HO+l4bzivlE9giLsWoAqOb0UonNt5/0l4hdMmP+WhDrAfVy1iFZB4LtQRh5gp/8PMpvz9xoF3FlVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767845690; c=relaxed/simple;
	bh=5v+QV2skJk4921XwaaCIdZfyxCtahUKTYMsazQJoUKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQnUTfDyG+fSE9Ul/nKgcB/fsB+3s+O2yU7sQ9/4s1ePy5ikDNhW0oX7raAhtLkVhGktT+REC+lGI2sUsZhECMHTcYYAC4sZo1Wzn4WoNf8s8KpZni6S+c9+7ZM7cBsSlOhswNDVQ1eQ/o7WR1mB15L4JS8GeMLbNOHCaRKmycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjObOs85; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjObOs85"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8bb6a27d407so250851085a.0
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 20:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767845686; x=1768450486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yAjFIwjl4VMJZ1+V1C6pz96OIbw8JbCPoa9P5fH03s=;
        b=QjObOs85/sJzp7tOXRyN7XC9v6hjIbf3RFCh4drQXSL23apYWZLl7XKZrp10+OPmM0
         nYwlwkXUnEQ0kkmegsFl1PV0FQd5D6hZbWihISb4vUnf+u/TW9GgR7PMcrXLecbMU8s0
         2dt5NH0wNNON148WOnic3bj7J6SFGWblXysL6wicEI18dhkmveIurjEOHLTZt5HtgPgH
         E1JhnSBe+yAOHCDhD+I6oq8IKJ3pkuYPai49DpZeD+tTfPj6sTXzsfaIwVUTDCoL/cOA
         PdzLJpbLt1/nVS62HWi+B1XLkKdf9sUmzuC5+Yy/K1IuKdzywlxPpS59Nht9WdyAELG/
         XmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767845686; x=1768450486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yAjFIwjl4VMJZ1+V1C6pz96OIbw8JbCPoa9P5fH03s=;
        b=AuGrAE/GVAq3FEF3gq17UU/g2z0vVC8abLMOf9KJq4fX5TE/OygIJTxyFcyb1nj5OG
         pc1YtkqRU/WvsPJg/aZgud7kLjFCJXktVBGVNhzo5pdFPvos3bZ07ibL5yBSZEq+AVLO
         3J6F6ixX8sCfy9lzM2MbotA6kjdXuRbcU0zD9qYW1izxVXj6yfu8Rn5KpU78/7DQkJHH
         e4RlY04gL/IV1T36Hae7q/3VpnIuiqkShT2QP+1eedR+tgUI3z5VhXkq01ZY9T3DQU8K
         fAgacvlQJOPoxshRPtX284eVS7p97ShuSLKf5NPDmpl1ZTFgRkVqpR8kiyEUFwHzL0rt
         +bqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk0j+OUzwFXrlIkKuoKUhDu989oIv4kuBF32E1SUhEDEfAvJh3OXgfU3QUveY3IMZuRK6lxtiOyI1AjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN07AYoT9KpFF/ucDux0NmjUAwbSEHGQ+QY7DIFU6LmsZeFWHo
	mhcRD7yXpepNcBO0/2m7ijPaMxSjqEr6Zva90o0zw9VAJ1xvmqjKLiaB
X-Gm-Gg: AY/fxX7qM2AD27Oqz1zFWvfntWt9qmhj4+DDpjeLVGTaFoFIXnRkCwaCbrpZscTAxKM
	nUGmUkJGeG9qLtknAGdBunOT2QPte2eMLPhJNP1kX4MgUau4v4cGSmlVS4ExIwALxIBkbWjIJWN
	H6W2/6bCPxNJEAvSQ7TnFpXItpZILd215dum3CzmN3srqj9JG7W2gqkE0IlZVVdC0BAOILvrxNC
	tAD+dgDfYWjtvexcpFhnEcxQ+cwsDwKKuZOYRMjmPe/Wwk8uyBwrztpBEN9EiANqYpaMVO7rhML
	XwwujXtlw3t0aVWhXbMAcV9MZpHr32T878983miRlljpvhTQ5cU5UGKG0LxQ0I4PlX/D+xny1nK
	hpHQUIsPy19HbKsEb+iMYxpQzPPR4OPAMrWGwhb0QU6a4q/EuVfdk49GPJUN6LxDaIJYnO1sXmM
	yvv2EVgo3M0516+A==
X-Google-Smtp-Source: AGHT+IF3KLEAoIR6iLJwpBg2iAqPNGhRNw28m2GAujrjVEQ/ioKoivK+pFkCUvt4wmrDlxfnphqTjA==
X-Received: by 2002:a05:620a:1a01:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c389384396mr587730185a.26.1767845685882;
        Wed, 07 Jan 2026 20:14:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a7962sm499071885a.11.2026.01.07.20.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 20:14:45 -0800 (PST)
Date: Wed, 7 Jan 2026 23:15:06 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aV8vSuCDhqCcuwuL@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
 <aV6qnjyXV-yTLqVl@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV6qnjyXV-yTLqVl@kekkonen.localdomain>

On Wed, Jan 07, 2026 at 08:49:02PM +0200, Sakari Ailus wrote:
> Hi Richard,
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
> Uh-oh.
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
> > +	usleep_range(5000, 5100);
> > +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> > +	usleep_range(8000, 8100);
> 
> Where do these values come from? Apparently 1 ms is required (after lifting
> xshutdown) before reading identification register and 10 ms is required
> (from the same point of time) before streaming can be enabled.

I don't have the hardware specification. The sequence seemed to last
12-13 ms. Dividing the delays are a guess and the camera can usually
open at least a few times.

The final 8 ms wait can be extended to 10 ms (assuming xshutdown is the
same as the reset line). Is there a minimum time for asserting the reset
(currently 5 ms), or can it be reduced to 1 ms?

New sequence (maybe, if the docs support it):

	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
	usleep_range(1000, 2000);
	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
	usleep_range(10000, 11000);
