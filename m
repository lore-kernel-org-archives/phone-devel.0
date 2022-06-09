Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11BEC43334
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbiFIIym (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242385AbiFIIy1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:54:27 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451401F741A
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:52:21 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id g201so12814421ybf.12
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WLRBbUkxuAe3aL123UT1/tEUnto7xw/+eJBq/RDDIX4=;
        b=oPx5nKc+eF6vxjkgA+yWtKUSPU/DhZXALzInPHVDm+4lac7KXoObN5umGx7MOTCJdh
         ajZQcpwYbeRbtal60gobYRMZjhTVg/JeXrMtA1flpBkk5NJm1ADeOcNEO9Y7u06OVMZh
         JTuJLnc5QXZ+wGPvJ6LHSb2WYe4o922TGBKJ7k60t2LUD8xUhtI156TxFfIkd/yTue1B
         4cVzWUi31JhavzqwODwsE0ZfPIvy7ZnvNX6GjONCyzOfPzn/JMe5D/TtcFz2drvzp0hf
         P/gbkdAmbLgRhEr323gFEqlhsOI68nd5050h691ctdTAcMzQt2uAA0BrwWuKrvO+76zK
         vj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WLRBbUkxuAe3aL123UT1/tEUnto7xw/+eJBq/RDDIX4=;
        b=0tqh/VOKjgTeXKOVf0I0N6XTYDJVoam4XBYQh1oFxEBBQ2tgILH+hofrwjbz6M/s/V
         8JHcfQZ6jCMBs+PAdk9rj5rZhcGCM9cRJu4tgqVtpFHtTMI0w0Ky0/pG/WWhRgCGkRzS
         iv4iSmYVD2+osiGVY5suTBqEbPlLUIys781grT+1QbnuNi87ukhNNS9EzN2xQ7/1+XqZ
         Xd+XYDz5du+RyQ+vFUWWAuFT+ZYsSCVV520xtGgrTyJr7xtRBlsjOod+RbNZy+ZIO9az
         k410j8sYj7DKpn/koIBH+vkA2jMQTf5ceGMG8Ap2o9yXElRhEkEbK34//1mZgmMZQs1P
         tb/w==
X-Gm-Message-State: AOAM532O+T+7u9eBlyMkXZ6+t2w5+zPs6FJgIgCt0sWv7eciHq1urNXD
        x7BIQtju7sEhtvnQv4bYkfkYac468PTzX04AJ5SdbwZI35g6RQ==
X-Google-Smtp-Source: ABdhPJwVp8uNHhAO5LGW6oQ6PTlrWr5m4L4s6MphhIpSEmcQAZzexfY34X40gprHvPquEideZzkdbgsxbRBH2KUMRGg=
X-Received: by 2002:a25:650a:0:b0:663:461f:86f2 with SMTP id
 z10-20020a25650a000000b00663461f86f2mr25015220ybb.514.1654764738144; Thu, 09
 Jun 2022 01:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <b7203b1bd378fc554fc2cdd435176d597272cd89.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <b7203b1bd378fc554fc2cdd435176d597272cd89.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:52:07 +0200
Message-ID: <CACRpkdZo1jNgtQEJgPEBNVs5M5JMD5WnO8gHEEOBFLtOSu=yAg@mail.gmail.com>
Subject: Re: [PATCH 2/7] iio: magnetometer: yas530: Correct scaling of
 magnetic axes
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Jun 9, 2022 at 1:38 AM Jakob Hauser <jahau@rocketmail.com> wrote:

> Looks like YAS530 raw values return picotesla and YAS532 nanotesla. Adapt
> comments and scaling.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Ooops. In-kernel device trees only use YAS530 so the fix does not seem
urgent, but it's up to Jonathan to decide whether this should even go to stable.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
