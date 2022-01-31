Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF109C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 31 Jan 2022 22:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbiAaWcq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Jan 2022 17:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbiAaWcp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Jan 2022 17:32:45 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DADFC06173E
        for <phone-devel@vger.kernel.org>; Mon, 31 Jan 2022 14:32:45 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id b12-20020a9d754c000000b0059eb935359eso14487708otl.8
        for <phone-devel@vger.kernel.org>; Mon, 31 Jan 2022 14:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EJ/CUgtIHi46E0n0IJIpbOlv1rJjoQXLPtDIDC5lc1I=;
        b=uLYRhfDhHs8xYKWBtR3VKyI1b325Butnhxjh3/n/uexJ2a2u4uMavBJd792mGuOYxK
         fLk7fMF4rtudzz8BeFklzf1y5lykq4UD1CCAam/w2QisZcknoeEXbtByl70+tgbTospC
         cf75wl/NMaFbOVurBCejGYbLmnAsWwd5NFaqIiG1dCnNILSZTYmunDrbkx5zaUAJxVdW
         xw0lpcnT76NiAdKk2CMiDoF1tAAbjvbExVIklcBzOvkzeWHprZ+5n8j3cme99VWDu180
         hOfUj+9tXXmfgBU4lVuJawg45CzuNHz3E4ZaNwQptPsCoK9ORLBG0CQaVdIkz2ikUn7i
         GRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EJ/CUgtIHi46E0n0IJIpbOlv1rJjoQXLPtDIDC5lc1I=;
        b=LbQx+TN5dAbO5eX/ZLJDs/KgH+Qy6bB6DGQU6QzzvkfiBiwyp0rNll4cT7BAt7/vKy
         ApYu5/epLf5fp0MbXFNOb55hkjbk2WjRHGzEm/LtZR4W2G1aUsPZA7xCI23r0jRrguC5
         /I6CKAlUnmeDUMkqkZOStN6U4dEHSxeZSV1O7S70SdIYO6AO58CxP6yZKDeJTcMY6uWt
         s+nRaUzYI6dU3jBN79Gf1Gv7aQj1y9jS8hLL+yn9hgS77d3Rq2XQ4iUcNE4QGjyGjRcW
         QLOBf0D2weTbIQqttr3D4rs54jJ7QvTLQ16rcVNALnxpoNwEy/j8HhvFguvvpKnShAID
         OZ5w==
X-Gm-Message-State: AOAM531iailaZ1rv1YmEAfpqrEsm6AJFNxH8ZX1aSiEfVFWrFwsCfMg4
        6VVIVBmovvMlZ0hkIVFM10NEng==
X-Google-Smtp-Source: ABdhPJzCioEdIMZ/atUp3VoFpZFGDJHJS5bJxgOl9ns95gxCXaMzpPRv4ZZYdL91ISjg6tk4b3fMgA==
X-Received: by 2002:a9d:7e98:: with SMTP id m24mr12906443otp.358.1643668364557;
        Mon, 31 Jan 2022 14:32:44 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id e68sm7997601otb.10.2022.01.31.14.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:32:43 -0800 (PST)
Date:   Mon, 31 Jan 2022 16:32:42 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 09/15] rpmsg: smd: Drop unnecessary condition for channel
 creation
Message-ID: <Yfhjil3pfZLa5g3j@builder.lan>
References: <20220112194118.178026-1-luca@z3ntu.xyz>
 <20220112194118.178026-10-luca@z3ntu.xyz>
 <Yd9KebiZUjTuHtIM@gerhold.net>
 <12385151.O9o76ZdvQC@g550jk>
 <YeRILypv8ajssNae@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeRILypv8ajssNae@gerhold.net>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun 16 Jan 10:30 CST 2022, Stephan Gerhold wrote:

> On Sun, Jan 16, 2022 at 05:08:29PM +0100, Luca Weiss wrote:
> > On Mittwoch, 12. Jänner 2022 22:39:53 CET Stephan Gerhold wrote:
> > > On Wed, Jan 12, 2022 at 08:40:58PM +0100, Luca Weiss wrote:
> > > > From: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > > 
> > > > RPM Firmware on variety of newer SoCs such as MSM8917 (also likely
> > > > MSM8937, MSM8940, MSM8952), MSM8953 and on some MSM8916 devices) doesn't
> > > > initiate opening of the SMD channel if it was previously opened by
> > > > bootloader. This doesn't allow probing of smd-rpm driver on such devices
> > > > because there is a check that requires RPM this behaviour.
> > > > 
> > > > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > > 
> > > This is effectively a "Revert "Revert "rpmsg: smd: Create device for all
> > > channels""":
> > > 
> > > https://lore.kernel.org/linux-arm-msm/20171212235857.10432-3-bjorn.andersson
> > > @linaro.org/
> > > https://lore.kernel.org/linux-arm-msm/20180315181244.8859-1-bjorn.andersson
> > > @linaro.org/
> > > 
> > > Won't this cause the same regression reported by Srinivas again?
> > > 
> > 
> > Do you have any suggestion on another way to solve this? Without this commit 
> > the regulators just won't probe at all, I haven't looked very deep into it 
> > though given this patch solves it.
> > 
> > I guess worst case it'll become a devicetree property to enable this quirk?
> > 
> 
> My spontaneous suggestion would be to skip the check only for the
> "rpm_requests" channel, e.g. something like
> 
> 	if (remote_state != SMD_CHANNEL_OPENING &&
> 	    remote_state != SMD_CHANNEL_OPENED &&
> 	    strcmp(channel->name, "rpm_requests")
> 		continue;
> 
> This will avoid changing the behavior for anything but the RPM channel.
> I don't think anything else is affected by the same problem (since the
> bootloader or earlier firmware should not make use of any other channel).
> Also, we definitely *always* want to open the channel to the RPM because
> otherwise almost everything breaks.
> 

Last time this came up I asked if someone could test if the RPM is stuck
in the state machine trying to close the channel and as such we could
kick it by making sure that we "ack" the closing of the channel and
hence it would come back up again.

But I don't remember seeing any outcome of this.

> Many solutions are possible though so at the end it is mostly up to
> Bjorn to decide I think. :)
> 

I would prefer to get an answer to above question, but if that doesn't
work (or look like crap) I'm willing to take your suggestion of skipping
the continue for the rpm_requests channel. Obviously with a comment
above describing why we're carrying that special case.

Regards,
Bjorn
