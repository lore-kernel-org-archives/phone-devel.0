Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3633BCD98CC
	for <phone-devel@archiver.kernel.org>; Tue, 10 Oct 2023 23:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344154AbjJJXfq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 10 Oct 2023 19:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344147AbjJJXfp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 10 Oct 2023 19:35:45 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46D3D8
        for <phone-devel@vger.kernel.org>; Tue, 10 Oct 2023 16:35:19 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307d20548adso5692899f8f.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Oct 2023 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696980918; x=1697585718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LjZKDe9/O8K0y8L+9b/aC5Un8hv6rl29pEpMV8QYUeo=;
        b=vstosVsVMZL5ht8PziMJeuBF5USw6EFglO4SvV+73Yhsga1eG48gCv02mlVIM3yNyx
         CsQsKBJAvi+JLpCmk5/WYlF11hqN0U3Dqnyks6dDgNgVe/PtnyQOtbUU/51z8mx5/bpL
         GhCUZhW2KOQE5O76q/WFVfAVWhUcX0f8hn4NxnE8NGrYSb7tlQFSbNZOwtitsLfBCEu9
         4FAvrqo9krDEU5mAfveL+ldy5PWZ6GXJ2uGS8IJbrsI5Uo2dvnC0V2PiAa0dJOj7KjDd
         Hj2TuAkQ60UhL1fmpZnuwVHQllADaEZT2Dmd7tQXGGjrptUPEiWqCojHhhr8AQYhBKaj
         /xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696980918; x=1697585718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjZKDe9/O8K0y8L+9b/aC5Un8hv6rl29pEpMV8QYUeo=;
        b=XUZwGqOUCf/nMBQDbn+SywvtHu+ahLpZcOmeJKk7+Wy9g0BhwzLtjodeTIpyBC+d8/
         tgeIGNOFCnpCJzxfAM1PPCV/hYr9/pHUG2PdrHfn1u5tFDROlFUIWgWox480beScl2wu
         y3yUtsqKRRseOcaYe5M+SZJB2ZkHq5brXXwMsAUxrohELNcc0TKwAVgJz4F1HmoakQDK
         swYCgpdLeCvNdQrBBZOi8Yrttrra2xW0PPOVheMpvofOUpt1IhH4tES1gkta4FmLVSbo
         XmxTpKBPqemCQqZVB6pIh+YUzXLSlk8NgZ0fuMTRCvLlJWyWDVaD8CTji/r6n85P1fJg
         HzUQ==
X-Gm-Message-State: AOJu0YzbHy8szTiklAJdcdr3zJDPla+sROlr40U2zGEUnbVh6lcrz8BA
        QexCAODhZ6i6LCn4POtYXo/gfg==
X-Google-Smtp-Source: AGHT+IEDNf335V6m6u6Ws1mKNWMxAhixI90BRzym+5lBdnAPduO19YbsTMdsYGIOrxATTIGlXt1sew==
X-Received: by 2002:a5d:4cc3:0:b0:31f:f8c1:f43c with SMTP id c3-20020a5d4cc3000000b0031ff8c1f43cmr16396445wrt.41.1696980918136;
        Tue, 10 Oct 2023 16:35:18 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id bv2-20020a0560001f0200b0032d09f7a713sm3029396wrb.18.2023.10.10.16.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 16:35:17 -0700 (PDT)
Message-ID: <47bd1c5d-4bac-4772-bf05-509d516e201e@linaro.org>
Date:   Wed, 11 Oct 2023 00:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
Content-Language: en-US
To:     =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Robert Mader <robert.mader@posteo.de>,
        Guido Gunther <agx@sigxcpu.org>,
        dri-devel@lists.freedesktop.org, Hector Martin <marcan@marcan.st>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        asahi@lists.linux.dev, ~postmarketos/upstreaming@lists.sr.ht
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
 <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
 <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
 <CW54GWXGYWEA.ER1Z3DVG83M0@andrad>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CW54GWXGYWEA.ER1Z3DVG83M0@andrad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/10/2023 23:53, Piotr Masłowski wrote:
> On Tue Oct 10, 2023 at 10:36 PM CEST, Caleb Connolly wrote:
> 
>>> So why am I writing all of this? Well, the problem I see is that any
>>> shape-based approach will likely suffer from both accuracy and
>>> complexity issues. Describing curves is hard and processing them is
>>> not something that should be included in e.g. whatever handles VTs.
>>
>> My proposal here doesn't require processing curves or doing any
>> complicated calculations. If you know that the display has a 30px radius
>> on all corners, you can adjust the VT to not use the top 30px of the
>> screen and it will start exactly where the radius stops.
> 
> Just a nitpick, but on a round smartwatch this approach will give you
> a $width × 0px famebuffer ;D

right right, it's a little more complicated, but not more or less with
either approach.

[...]
>>> - gathering the data is very straightforward – just light the relevant
>>>   pixels one-by-one and check if you see them
>>> - pixel-perfect accuracy is the default
>>
>> I think it would be fairly straightforward to do this for curve data
>> too. You just bump the radius up/down until it looks right, or "good enough"
> 
> Well, different people will have different standards and what might be
> good enough for some will annoy others. I'm not saying that we need to
> be perfect at all cost, but if there's a relatively easy way to cut down
> on inconsistency, it might be worth taking.
> 
> Additionally, having a very clear-cut quality indicator could remove a
> whole class of bikeshedding options. (speaking of the devil xD)
> 
> 
> The problem I have with curves is, the more 'correct' you make them, the
> more convoluted they become. Like take for example the corners. Rounded
> corners are circular right? But what if someone makes them 'squircular'?
> Well, they are usually quite small anyway so maybe it will work out.
> 
> But then what about a smartwatch with big, squircle-shaped display? Bam,
> now you need to complicate how corners are handled.

They don't need to be correct, you don't need to complicate it, you just
need a value that plays nice. When it comes down to it you're much more
likely to be constrained by UI layout limitations by not being able to
model the precise corner curves of your device. The difference between a
circular and elliptical arc is negligible in all real world use cases.
> 
> But also: are rounded coners typically circular? Just now I've thrown a
> OnePlus 6 (thank you so much for the great mainline support btw!) onto a
> flatbed scanner. While a circle fits decently well there it's not really
> a perfect fit, so maybe they went with a different curve after all.
> 
> That being said, imperfection isn't my main issue with curves. It's all
> the non-discreteness they bring to the table. As in, you now need to care
> about approximations, rounding, imprecise measurements and so on.

My point is that actually you don't. Other than for animated visual
effects (where an undersized curve would absolutely be acceptable) I
can't conceive of a situation where plain triangles wouldn't be
suitable, again slightly undersized of course.
> 
> 
>> I think the unfortunate truth is that approximating notches and rounded
>> corners exclusively with regular arcs at the cost of pixel accuracy is
>> just such a no-brainer. Pixel masks would be pixel accurate, but there
>> is no benefit compared to a slightly underfit curve.
> 
> Frankly, I don't see any significant cost here. It's very easy to gather
> and rather easy to process.

Unless I'm mistaken, it would mean that for "odd" shapes like rounded
corners, the number of values you need to record would be directly
proportional to the number of rows. You can do some optimisations, but
that worst case is really not great. Especially when the arc
approximation requires a single value and covers all the same usecases
as well or better.
> 
> Let me think about it… The most common operations I see people actually
> doing with this data would be:
> 
> * letterboxing – easy with both curves and masks
> * ensuring padding | margins for icons on the screen – with curves you
>   can use a formula, but won't it be easier to just count pixels anyway?

You'd probably want your status bar icons to be equi-distant from the
top and side, at least that's what my Android phone does. But hey, maybe
you don't, we can't bikeshed UX design all day but I'd think a simple
radius is gonna be easier to deal with than a pixel mask in most cases
(especially considering that most UI frameworks don't work in the pixel
space anyway because of scaling).

> * routing a spline along the border – like if you want to have some
>   periodic pattern drawn there, it's probably a bit easier to do with
>   curves
> * drawing something at a constant distance from the border – with curves
>   you can again use exact formulas. But isn't that an overkill really?
>   I'd think most people will go for something like a morphological
>   dilation instead

Right right
> 
>>
>> Any program which wanted to make use of the curve information would have
>> to run a whole curve fitting algorithm, whereas there simply aren't any
>> programs which need to know about display occlusions to a pixel-accurate
>> level. For padding a status bar you do a single trig equation, for
>> avoiding the notch in fullscreen you would query the DRM subsystem which
>> presumably would export the dimensions of a letterboxed "usable size".
> 
> What could the curve information be needed for though?
> The more I think about it, the less value I see in it really. Like, if
> you're adjusting the screen contents, pixels _are_ the smallest unit you
> need to concern yourself with. The only thing that comes up to my mind
> is if you were to animate the cutout shape somewhere else, zoomed in.
> And thats already a quite contrived scenario.

GNOME doesn't even use real pixels, macOS doesn't use real pixels. When
scaling comes into play the advantage is lost either way.
> 
> Is there actually any use case that instead of ending up with pixels
> either way, would be better served by a (possibly inaccurate) curve?
> (future me here: that spline-along-the-border from earlier I guess)

I feel like the burden of proof still lies with you here. I feel much
more comfortable with a handful of easy to reason about and explain
values (that can be easily reviewed by maintainers) over a blob of data
that grows with the resolution of your display.

Thanks,
> 
> --
> Cheers,
> Piotr Masłowski

-- 
// Caleb (they/them)
