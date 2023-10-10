Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B622CD8CB4
	for <phone-devel@archiver.kernel.org>; Tue, 10 Oct 2023 20:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjJJUgW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 10 Oct 2023 16:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjJJUgV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 10 Oct 2023 16:36:21 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12A899
        for <phone-devel@vger.kernel.org>; Tue, 10 Oct 2023 13:36:18 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406618d0991so56371615e9.2
        for <phone-devel@vger.kernel.org>; Tue, 10 Oct 2023 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696970177; x=1697574977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLMEvVGbmf7BPPeQS/E70czWupdopX1y8XuMlLKDcXA=;
        b=uBv4PZu8qoTnSiNfkUTJlDzRJQXZod0uEo2giYrTP8pXnnUCPcYwM0+Mo0yowz1OnB
         DXPckhZHxxfY2CnH8nTwQpWRA/GDP7TgtX8OG0lpJHR+FE1sArToovCGihxSR7/AIRDp
         wiPrRaQTzTZqvG0bXtcOo3YJPeJ66CJ6rKvqKpKyF9UF3cS8GKynsMr4a/vDWdJWj5Li
         ujeS9f9oqOEZhKKI9+U0X2FWtfVNPmPQaTHaC/wGA4TiboII4QCmifaIhk6aJPlyaj5i
         LhYmXipJLSBk4ALw3EIfC1uRlUnetieyVScuz/CtvluE2juG5GwQWSuN4QSRd7tn7zhd
         F38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696970177; x=1697574977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLMEvVGbmf7BPPeQS/E70czWupdopX1y8XuMlLKDcXA=;
        b=mfnUjlTnXasgBPY915Dievt9iT1/aKIFvhKeyrbB0L2OUa4HY9bqjX9z0JlU3CGYQl
         l8P1avRcx1f+Pe2ThxsSGQHC9cERWdPKb8hVCwtPqPMZwBLhGORW3wz4QTyEXVaUgIjF
         /cXx3wXd9WG+5FZm5+4fl9p218WzNfUuPHZGJeb8eVbUcvf4hKB960B3Hk+Yjqaj/YL5
         7Wl8GqmjUIXqDjkR8HX6ZpOp7x5wQwp19tpU4C6nPT9Wd41r3jQoqRiH4lLcD7ba8wVv
         sYN4MBPPBOJ339R9Pj4mWH/6NTa8nUH3G0Xlk9qCPaneiX1aXQQDejTjgcVKWk6xmZWD
         1SzQ==
X-Gm-Message-State: AOJu0YxktR36FGzvrVVkSNE4JQmETtL3h/V7gI3gL5Yg+UcfjMUZQEGg
        w7+frLT12+RaPtnSLpH0cPjkKg==
X-Google-Smtp-Source: AGHT+IFBEDz1+5oU3WpkeZaaKylWil5wrABkAGjh5kyudxu7O3xK7PKwwdxhynqlILWXgXMHuq5xwg==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id p1-20020adfcc81000000b00321597123a5mr16998528wrj.20.1696970177116;
        Tue, 10 Oct 2023 13:36:17 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d538c000000b0032769103ae9sm13558025wrv.69.2023.10.10.13.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 13:36:16 -0700 (PDT)
Message-ID: <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
Date:   Tue, 10 Oct 2023 21:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
Content-Language: en-US
To:     =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Robert Mader <robert.mader@posteo.de>,
        Guido Gunther <agx@sigxcpu.org>,
        dri-devel@lists.freedesktop.org, Hector Martin <marcan@marcan.st>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        asahi@lists.linux.dev, ~postmarketos/upstreaming@lists.sr.ht
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
 <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/10/2023 21:01, Piotr Masłowski wrote:
> Hi Caleb,
> 
> Thanks for posting this. I've been meaning to chime in on the discussion
> about notches and co. for months now, so this makes a perfect opportunity
> to finally do so.
> 
> On Mon Oct 9, 2023 at 7:32 PM CEST, Caleb Connolly wrote:
> 
>> Some folks have previously suggested that this information belongs in
>> userspace and not in devicetree. I would like to be clear that
>> devicetree is for describing hardware, and parts of a display which can
>> never actually be seen are very much properties of the underlying
>> hardware.
> 
> Yes, thank you! Seeing the kernel log (or Tuxes) partially hidden behind
> the notch (or the top-left rounded corner) is just so annoying, so DT is
> definitely the way to go here.


Exactly! Glad that others care about the _real_ issue here ;P

[...]
> 
> 
> So why am I writing all of this? Well, the problem I see is that any
> shape-based approach will likely suffer from both accuracy and
> complexity issues. Describing curves is hard and processing them is
> not something that should be included in e.g. whatever handles VTs.

My proposal here doesn't require processing curves or doing any
complicated calculations. If you know that the display has a 30px radius
on all corners, you can adjust the VT to not use the top 30px of the
screen and it will start exactly where the radius stops.

If you know that there is a (potentially very curvy) notch at the top of
the screen, you can just iterate over the arcs, add their radius to
their Y coordinate and take the maximum. This will always give you at
least the height of the notch (you'd probably want to check that their
angle is vaguely downward, but again this is trivial fast integer math).

[...]
> 
> However, there's a different approach that is both extremely simple and
> yet trivially correct – pixel masks!
> 
> Basically, instead of trying to describe what shape a cutout, notch or
> other feature has, we just say which pixels belong to it. In short, this:
> 
> - can be easily processed even by 'dumb' programs – for example, you can
>   derive minimal margins to 'letterbox' the screen

As above (and as mentioned in the patch) this is also trivial to derive
from the curves.
> - gathering the data is very straightforward – just light the relevant
>   pixels one-by-one and check if you see them
> - pixel-perfect accuracy is the default

I think it would be fairly straightforward to do this for curve data
too. You just bump the radius up/down until it looks right, or "good enough"
> 
> Of course this is not a perfect solution. Here are the drawback that I
> can see:
> 
> - low resolution screens mean low resolution data
> - 'smart' programs may or may not need a bit more logic than otherwise
> - sub-pixel accuracy is impossible or requires extending this scheme
>   - non-binary (fractional) weights
>   - partially-occluded pixels on a separate mask (so each feature would
>     have two adjacent masks – for its interior and for the border)
> 
> 
> As a futher improvement, besides looking at pixels we could think about
> subpixels instead. Still, this can easily be added later and likely even
> in a backwards-compatible manner.
> 
> An orthogonal issue is labeling all of those regions. I think we should
> start with fully obscured areas and maybe less readable ones like the
> waterfall edges. Still, different features should live on different
> masks – even if we don't attach meaningfull labels (like 'notch' or
> 'camera cutout') to them right away.
> 
> 
> What do you all think of that? I didn't see this approach considered in
> any of the earlier discussions, yet it seems so elegant to me. Am I
> missing something?

I think the unfortunate truth is that approximating notches and rounded
corners exclusively with regular arcs at the cost of pixel accuracy is
just such a no-brainer. Pixel masks would be pixel accurate, but there
is no benefit compared to a slightly underfit curve.

Any program which wanted to make use of the curve information would have
to run a whole curve fitting algorithm, whereas there simply aren't any
programs which need to know about display occlusions to a pixel-accurate
level. For padding a status bar you do a single trig equation, for
avoiding the notch in fullscreen you would query the DRM subsystem which
presumably would export the dimensions of a letterboxed "usable size".

To be clear though, I wouldn't mind being proven wrong on this, but I'm
yet to find some information which doesn't line up with this conclusion.
> 
> --
> Cheers,
> Piotr Masłowski

-- 
// Caleb (they/them)
