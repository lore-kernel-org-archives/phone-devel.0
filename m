Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D319C05027
	for <phone-devel@archiver.kernel.org>; Thu, 26 Jan 2023 09:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236727AbjAZJVM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236766AbjAZJVG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Jan 2023 04:21:06 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751FE6DB0A
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 01:20:36 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id c124so1222759ybb.13
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 01:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIKEvOOg7TxzJsXrhjVfUqlDl2sn+UZTz4Rc3TrrEIg=;
        b=EU+lbcT2YXVKDKLTzTc9xoNHdYMHEY4ls1ny1gl0zY48FTpW//8jI3QofPN0sWDSAS
         TvtLp78RSPzqsf5RjNoCQYwbDOeTM9mxYnvI5jWNNhec9eXnpZFy41PH9wQ7cvRRM9vg
         OAlxEBnZhYSf8BivgEDC1fEi/f3vDVIWR8F2KUdI4iF9ck2gZFprXs0aWRLzkOA1SZJw
         2A4YryUL68LaCAn4yjMY37H6mar2QGcXvk4sXKngcET1iY3lqGllb8PQQcQp0HqZlwu4
         TFpU1QiOnhB+2/1m/mq9zalQNvR5tAVWPYkgk+9BZ6d0Mj6UvI0SslJsab0xUpjKTlYG
         7aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIKEvOOg7TxzJsXrhjVfUqlDl2sn+UZTz4Rc3TrrEIg=;
        b=NYZCDz6KgfvWTZp97ayikNxSJwn7xUrq2Sfo/7mJqai1cfsPVubkskt3uzBiODu5q4
         mcYjaU/uBSKBdUsqsx2iM5jqmRQTN2RGbWXviAul6pDa8LNRmPFjjxoF0HeJfPw9C0Rg
         C7ccDgJ4kQgXSNV0b1hJYETy/PtDvoom/jm6dRYOMn5ExYmSqAZ1ae/eGgByK/eKx3tZ
         5uYdBeg8eIekFM7L40FgwbJCyg2+ayhqMB6Qtuuq3qq5xYW/WNt5BXQZVBKqnaIzNAq2
         UDUZlndVXQ+DFk6EG7l1AKOf+rUrzvfZ3COmU7MKSRZS/Cxxsaxv0JmYBxE6NEmj5ArA
         U/fQ==
X-Gm-Message-State: AO0yUKXyX4IF3+s02yJ2maD5dCAEHfa+aZLV57hIZA5zUUqu2B0RiQoC
        OPOLKUn7p7FEwm7NGp+XOAKXcd9f+mbeQt2piKIZDsGbFbJ2DQ==
X-Google-Smtp-Source: AK7set8m/Xg0MJ7/99ZvKeG68+dkRAlcmiiG+bqKuRQ0G4YH4PseVSz70LckNk7ZIgH2jjYRjY0X7CiCw7kAATCj9G4=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr953646ybg.584.1674724834790; Thu, 26
 Jan 2023 01:20:34 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
 <CACRpkdZVH8nu=4a4MuQZ=uUpqg1MBXShCU_Bm3CUxPg1adO8BA@mail.gmail.com> <6b53a127-4529-4283-be4e-1724de98fd37@app.fastmail.com>
In-Reply-To: <6b53a127-4529-4283-be4e-1724de98fd37@app.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 10:20:23 +0100
Message-ID: <CACRpkdbXhkyfDScawebq0g-xc03OPS8aPaRWnzbA2pXZ+ahZ_A@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 DTS updates
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Jan 26, 2023 at 10:09 AM Arnd Bergmann <arnd@arndb.de> wrote:

> I pulled it manually, but if you notice something like
> this again, it's better if you follow up with a v2 pull
> request. Patchwork should notice this and mark the first
> version as superseded in this case.

Hm yeah I did that before actually it works fine, just didn't think
about it...

Thanks for pulling!

Yours,
Linus Walleij
