Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C83E13D622
	for <phone-devel@vger.kernel.org>; Tue,  9 Apr 2024 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676956; cv=none; b=l+Vo3sLe2U996oztOoW/2296KU9v8V1dJBXxF5u/aVSqmdlUMZS44Z1TuJ5D9z+J3cBUVklYdL9ZbyIskoS7ISxlM6zT2dgFtq1t+1jzA7TGfNFJypZgnwpIm1os0RJjSMMKH6KNxhWglaYqFr5Z7Dk0mewYeS1fKZ7fm/7BzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676956; c=relaxed/simple;
	bh=P04LBfkaeW2XuO46xw0RoQrDoyCOfrzCkGumelNfjDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUfx0k+BrLRkvA39WeqO7JmlGmJFiV20ohQ6UVyIoh1ibfISBzDmMeJ2on/+SFu8gQPDh5CZMCSPH3wABct1Y5w6TilsLpuHugBzlauIEnwmDlMIcx/NuJNslRwPdr2GJXwdc889NZ237Rz31PlBhkJ04tmqRVboIWYTEhdDKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ifzo3XZ0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ifzo3XZ0"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so53788921fa.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Apr 2024 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676953; x=1713281753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BRsd3hpzzr4WHD3K4LXpLnFX04nl95mWHv7i9FXsiIo=;
        b=Ifzo3XZ0knqheuQUy5YJ25SbTbC+2x+t6hBB9lkdL0R/ZGHelTE41TUNcl/2VBLLJv
         ZqFqWGbhrUW8g/QchdBkBBeSZJ+/OirjmC+EyL1RR5IwfPq+L2bVDHXgaLIqBvhAJmZ/
         SL4fKCGd7XVJBo3oNR3W6MjIXdzCjzeJeziR+Y9+hYdtfSHtVw2iT9CRLr5lYUTPd6Rk
         I8+l0aUfqC6hMxogPlb9itjA7REQBUY+fH121jd/r/GRWYV86JQzhUGij5LX387nytbb
         NgyI5PyUrXDbwDx5mD0ix9MK+KIpYOsgdZYR7I6uRUyeW7h6DCBLeyF2ykzpZPXjNqUT
         1cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676953; x=1713281753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRsd3hpzzr4WHD3K4LXpLnFX04nl95mWHv7i9FXsiIo=;
        b=w18AKonuXRcdInf9X3WX2sk8Y9t1e/1vXUHqyqIGUIsFrUHC6lmJPn647equ/UuoAv
         gg5EYuQLWMvSaIwNhQYs0aNlg86eWzZnMLrrHyAmOn6EdiZ5bnVDy/NMxNPiagFDB4ho
         Qy5QgsI0obF98jU3SrLKkuo+Yftgr9CB4f9TkSYuWVY3zpgEEuJEOGWv1ZzZAPdheQdB
         tBIf94raAMiSrIwuJQF1oUHl7Byy93tBnuVmGnjPuAhKyd/9xpdc2TwSgj3ja4QYFHhK
         hGt5af60KfKqhcR7X6WUWDRH+96QgrNkJ98WiDHO+2E0DXJa1RxAIAEO+tvLjnEGZa9P
         s2yw==
X-Forwarded-Encrypted: i=1; AJvYcCU5k764/aXvp6Vx7dFwLAd85kKNb6q1x9wrA4ATVnQbYYY0M9H26/h8n14isrQCjVPe8YzZH71dWl2NlEE6YmVT046mElVtq0fG4hQ=
X-Gm-Message-State: AOJu0YwVlH0/C8DCNxxOmB8WVsydzrwqLo6PYF3V7eK39bHjLa+VJU+8
	Hfyh2wNcPjNIg5CWjGCmxDn7Xk6rENCorI8nu6rTs8eEVtqDKI72dCnFG6tuuw8=
X-Google-Smtp-Source: AGHT+IHJYOHXxN+KPaWlA8Ai6GNsv61R44Zkfg2lEX23bMYFoBeClEaCKCd8pkT/YOsSHwvrrH2xYQ==
X-Received: by 2002:a2e:9259:0:b0:2d8:a1b3:d4ba with SMTP id v25-20020a2e9259000000b002d8a1b3d4bamr4385ljg.11.1712676952665;
        Tue, 09 Apr 2024 08:35:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id m15-20020a2e910f000000b002d808b86073sm1571238ljg.78.2024.04.09.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:35:52 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:35:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	phone-devel@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, fiona.klute@gmx.de, 
	martijn@brixit.nl, samuel@sholland.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, megi@xff.cz
Subject: Re: [PATCHv3 2/2] usb: typec: anx7688: Add driver for ANX7688 USB-C
 HDMI bridge
Message-ID: <4q7o5vb26ibkbvqal5nn4kdnc32rrajhtszrf4fnuisnlfcsg5@6322saeu7qoe>
References: <ZhPMHdt6r/4D99Zg@duo.ucw.cz>
 <ZhPM4XU8ttsFftBd@duo.ucw.cz>
 <ZhUQ6kzV5ARlkfPC@kuha.fi.intel.com>
 <ZhUgrNwRYoaV1AIJ@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhUgrNwRYoaV1AIJ@duo.ucw.cz>

On Tue, Apr 09, 2024 at 01:04:12PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > This is driver for ANX7688 USB-C HDMI, with flashing and debugging
> > > features removed. ANX7688 is rather criticial piece on PinePhone,
> > > there's no display and no battery charging without it.
> > > 
> > > There's likely more work to be done here, but having basic support
> > > in mainline is needed to be able to work on the other stuff
> > > (networking, cameras, power management).
> > > 
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > Co-developed-by: Martijn Braam <martijn@brixit.nl>
> > > Co-developed-by: Samuel Holland <samuel@sholland.org>
> > > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > 
> > Just couple of quick comments below - I did not have time to go over
> > this very thoroughly, but I think you need to make a new version in
> > any case because of comments in 1/2.
> 

[skipped]

> 
> > > +static int anx7688_connect(struct anx7688 *anx7688)
> > > +{
> > > +	struct typec_partner_desc desc = {};
> > > +	int ret, i;
> > > +	u8 fw[2];
> > > +	const u8 dp_snk_identity[16] = {
> > > +		0x00, 0x00, 0x00, 0xec,	/* id header */
> > > +		0x00, 0x00, 0x00, 0x00,	/* cert stat */
> > > +		0x00, 0x00, 0x00, 0x00,	/* product type */
> > > +		0x39, 0x00, 0x00, 0x51	/* alt mode adapter */
> > > +	};
> > > +	const u8 svid[4] = {
> > > +		0x00, 0x00, 0x01, 0xff,
> > > +	};
> > 
> > Why not get those from DT?
> 
> Are you sure it belongs to the DT (and that DT people will agree)?

From Documentation/devicetree/bindings/connector/usb-connector.yaml:

            altmodes {
                displayport {
                    svid = /bits/ 16 <0xff01>;
                    vdo = <0x00001c46>;
                };
            };

BTW, I don't see the VDO for the DP altmode in your code. Maybe I missed
it at a quick glance.

> 
> > > +	u32 caps[8];
> > > +


-- 
With best wishes
Dmitry
