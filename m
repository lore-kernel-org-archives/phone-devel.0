Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F543C63697
	for <phone-devel@archiver.kernel.org>; Tue, 17 Nov 2020 20:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D7E1238E6
	for <phone-devel@archiver.kernel.org>; Tue, 17 Nov 2020 20:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9v1QVq5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbgKQUE3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 17 Nov 2020 15:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730801AbgKQUE3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 17 Nov 2020 15:04:29 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC4AC0613CF
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2020 12:04:28 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id e139so12402922lfd.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2020 12:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQkFGL0XDFRfUFUn+hfgyMvSdBv+O+SQSvUfUOZsWGc=;
        b=j9v1QVq5imwxYgPbp8Ohc1CbtdxQOUcbqbnPp9806Kh42QMTEFGhoXSEV1yz6rZoW1
         yuKZH9xjnzULdpb0vqerCV7xUqnV7KIUvSgooQjmY+wSn4BKMm+ISRuYpXE3UaCVkAxv
         qhbQpvUz15qGv/WB8a9+7Q2QqU9MdblhS3SA3RB0OeMrwb3l+JIqGRlohrtxjqj6/ql4
         Uv+UtucdgpLjWe2jW92468oZverdsEOxiqTUW+nRBRF39CLso9btz7N5/TdZZqkeSmQW
         ZBis7fEQQqK4/k+rbuU24Wil+iXr6WzEQIf7igT+Ddcdlg+t2be8sdisnksjrTU7BUOu
         SmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQkFGL0XDFRfUFUn+hfgyMvSdBv+O+SQSvUfUOZsWGc=;
        b=m5pmTfg6OQx1QkFA8aAZ56qfe8MVG4YK0jQkrE/E9fNSX1Vk+4OzZtzIvI/8XB6hlj
         VS1fTFSlaj0E13owGk0uvKPn1SF8c19K9WTZ4s7LUEMyFswpHlpbVyDmzMwCOxddXYzf
         a/wNoGFPQ8m1+1LCZawiI03DeEKdfcRwTSpTNB2n7rltJrC/vmr/sTKkbHEXVawQbcin
         Gx8rkK0bbWErKIZpXjXumQ0XDM/u5s5ti61jSJ/ZFtYaBdGuzxpEiv1wYITkHRXV2Emg
         KyehJAZr2sIMvze8eknjJQbWMxmubm3Z9xcd0S/7noe5k4FPkUqhBg/Yf3gVKGdnfeDg
         /9pg==
X-Gm-Message-State: AOAM532SWW3pAVmaR/DDlDDhCwcDYTot6T93Cxey6JPD+84ukRKanpMd
        YNf0tfVlGg0u72/jgziJQ5tHZULf9Y/F6ulTJ1ZAqQ==
X-Google-Smtp-Source: ABdhPJxFcnxMsym+ODrdjo/sAR80MZBssvUBZYTC1Ydoe4+uK74fFf8Juxfuz6bcr46XzPf965ATqBLRvXSIoSwyenA=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr2218700lfq.585.1605643467292;
 Tue, 17 Nov 2020 12:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20201117175413.869871-1-linus.walleij@linaro.org> <20201117192414.GA15239@ravnborg.org>
In-Reply-To: <20201117192414.GA15239@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 21:04:16 +0100
Message-ID: <CACRpkdbNeqTfTme9jygtdRnZuB=_3JN5HGr=LcrO94By-G7UHA@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix RGB/BGR bug
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, Nov 17, 2020 at 8:24 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> > Cc: phone-devel@vger.kernel.org
> > Cc: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

> Fixes: ??

It's no regression actually: for the current hardware we just
invert the buffers twice and it looks OK. Buffers are declared
BGR and then BGR-switched again by the DSI formatter.

But when adding DPI (I have some two other patches on the
list) this needs to be corrected.

Yours,
Linus Walleij
