Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE25C433C1
	for <phone-devel@archiver.kernel.org>; Mon, 22 Mar 2021 10:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 345796196C
	for <phone-devel@archiver.kernel.org>; Mon, 22 Mar 2021 10:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCVKG0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 22 Mar 2021 06:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhCVKGZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 22 Mar 2021 06:06:25 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A514C061574
        for <phone-devel@vger.kernel.org>; Mon, 22 Mar 2021 03:06:24 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id g24so11823424qts.6
        for <phone-devel@vger.kernel.org>; Mon, 22 Mar 2021 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vf/5HgYx6LWwvoRolmFRVnyW/drpHUHdwRcor8lAHsI=;
        b=XVOcmJ7r0DPh1ZxYfLBycDBz3qxlIIuUKEf+v+uhgY4C6GZi4oEYfYWjGEXmHDgHsb
         mfFdFGy6b7eHFPq5dKE1q7+8DnOIuCnqX8Y19NhWGhe4zNGwTUiW/Gw0aIl0Atdo2e0X
         Q6kx6btW8emWFax+vll8Nnk6/Odi0fSZlaQY0i9YKUgtV+5ONYwU8YnPVoPmi1uW8zwV
         lFUCkMG6znf0yWbevL9u4rOG8dg+q2V3jCvH//saCRa4qh0Y/sWHN2myURnbTP2MZm6k
         U7/PtMPPiohnlmc6yUWPpTVce+n4oRRwceTgzomvFX+JJGKLb0JAUNXI3XTDghUvZRfI
         S36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vf/5HgYx6LWwvoRolmFRVnyW/drpHUHdwRcor8lAHsI=;
        b=nec/eklPNb2S/OJgjCChsmj8WjgFKizyholePVaEkL32PZGwsGQN++VxmK1LKil7QN
         JwqFZGPLPh21Tdb5RcbTwSKyyETYFXdJuyu0zojXKd1xzFuJBtf2dP0XTGPwFajuA7md
         NtDpukrcRY7eXgF+SSWwYYgMtPRGLgYZrnyFkba0taGk4x2AEuelmVeBZcvlAcPedjlN
         xkFw2cXa0Kc/SPA3L7DwInpUadfOgFy+BDlbyka4zDNwg0QFh3kjuUdBuIpZvVc5EQuQ
         C4nd4zFYcj2Sr+pYt32TBqAJBUtrppBpHWanfULbbnZvXARfSyEDdZ7LxmFdn4zOv7j1
         FZEQ==
X-Gm-Message-State: AOAM532NXOcLYwWi4ptN0LkTkaZdTuf8T198bmk94y3hmJYAWtDARWvm
        KBIunVRlnnf1BhJe0hf69QP3bJCDNcBqLw5BgJreMaOgjOXkQw==
X-Google-Smtp-Source: ABdhPJy5OzPEN/ZreL80BJyspZAxdAp0hWlmc7hOE70IdwVB7+dOCQtCtyAAm2Z/jlDcWcWaXtC8NsxGc8KkmRZi6Ko=
X-Received: by 2002:ac8:1385:: with SMTP id h5mr8983260qtj.298.1616407583771;
 Mon, 22 Mar 2021 03:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210321174522.123036-1-caleb@connolly.tech>
In-Reply-To: <20210321174522.123036-1-caleb@connolly.tech>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 22 Mar 2021 13:06:12 +0300
Message-ID: <CAA8EJppgALn_A5CVO_RSzpef_aE5uSefdL37=JMFqS60hYgR-A@mail.gmail.com>
Subject: Re: (No Subject)
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 21 Mar 2021 at 20:47, Caleb Connolly <caleb@connolly.tech> wrote:
>
> Subject: v2: arm64: dts: sm8150: start populating qups
>
> The QUPs are rather sparse, lets add the zero-th and second qup nodes,
> the iommus properties for all of them and the i2c nodes.
>
> With this it's now possible to bringup the touchscreen on my
> device, and without crashing!
>
> Derived from OnePlus 7 Pro downstream kernel sources.
>
>         Caleb

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Of note, I'm only able to properly test i2c17, as that's what my
> touchscreen is attached to. Enabling i2c18 causes my device to lockup
> during probe, I suspect those pins are used for some other purpose on my
> device.
>
> Changes since v1:
>  * Pick up Reviewed-By's from Vinod and Bhupesh
>  * Squash second patch into first
>  * Add iommus property to dt-binding docs for geni
>  * Fix i2c19 being mistakenly enabled by default
>
> Caleb Connolly (3):
>       arm64: dts: qcom: sm8150: add other QUP nodes and iommus
>       arm64: dts: qcom: sm8150: add i2c nodes
>       dt-bindings: qcom: geni-se: document iommus
>
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 549 +++++++++++++++++++++++++++++++++++
>  1 file changed, 549 insertions(+)
>
>


-- 
With best wishes
Dmitry
