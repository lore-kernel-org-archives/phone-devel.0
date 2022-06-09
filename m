Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3166BC433EF
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242084AbiFIIvp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242102AbiFIIvQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:51:16 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59714BFEF
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:50:57 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id l204so40625595ybf.10
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CDMGnU/5QuisJhku5mR9LWhJd7uvk2ybw9nJB94v05A=;
        b=dpOPL9sHNWa8TVOJPyi/p5NNyuKJtsDmFGUp84aW3j1XKEGP6YMUeInce5E0ocSV0V
         ybhO0qyomunjRd3UjjDsCqamQifMI7mhi77aa22tCYUeP34cnUn+hsWpAQQY6d7IzaU6
         CGD2f+i9YgUo9WX3lng98332cqygBA6+BVXCIliCifHejM+Zesfy8ebGBuOrcTHRzDGo
         8q8CVJVmqUZi1KfJpFaSywTmct968RPomQlj8LrsN9wywPeDS+AZdZW47IqHRc2vUDYy
         bPnTLTRg130b7BD0uaUF4k9RN01z193Jnt6edLtHYAfHJwlCeLQ+mPXsR5a581ghprn6
         PsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CDMGnU/5QuisJhku5mR9LWhJd7uvk2ybw9nJB94v05A=;
        b=mcPhdwGKyAFPKABOsX2lG2ZIFuxGS1E4sZPC4KMk7wBA4ZXFH+phDni0nwfaxr4P+C
         MA1JXXXGOn8WaFkl8vcwkcR8YAlXJ8STfgGhl748IMPEN0keKrg/pfcKKicQvaXBtvE/
         1LUC/w+q3zF1eQCn09IIefx8Ril+Bs1PtyfKxXBTO83gEY7eanerA/xPbahRYgYDw6NN
         cR0wex9bqsf1rZwSEwEZWLMiXtppGYJkWK0KhSU46ewAGQIHDNSSGgWNid+vz3Y3hzg+
         EgzsH4eMV7pzUfaRkdRPfDXdJZ9cIUQ0pShpTz5DPmRq1VYPcAsRHJoQ7VdUdLLYkiaa
         okjA==
X-Gm-Message-State: AOAM533aORDrqmTN91JGgEHGZuQ5WHXIOVzKh/omsyMaQiiw5R+dEvEl
        u7yE0abJFQfGgJhyZ5rYGyXQOa+OfiScpimkz5r3mg==
X-Google-Smtp-Source: ABdhPJzRcUEcD1jJVh9AkIq3EqlZt60G5uOjCVMy1Mw4sELrG5G4EEQ2xCVv9140uiuZu2W9oTPaewYvWloZ2MQIAZ4=
X-Received: by 2002:a25:b686:0:b0:664:2b6:8e13 with SMTP id
 s6-20020a25b686000000b0066402b68e13mr6732352ybj.533.1654764657132; Thu, 09
 Jun 2022 01:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <719fc290550c40ccb75b1444917b91f69619806b.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <719fc290550c40ccb75b1444917b91f69619806b.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:50:45 +0200
Message-ID: <CACRpkdYmkk2pQT8rFeW77V-JMwknE8ejD+uU+mx8Bxo6zu4G0w@mail.gmail.com>
Subject: Re: [PATCH 1/7] iio: magnetometer: yas530: Change range of data in
 volatile register
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

> In function yas5xx_volatile_reg(), the range for measure data should end at
> "YAS5XX_MEASURE_DATA + 7" instead of "+ 8" as we count from 0 to 7 here.
>
> This change is of low importance as the "+ 8" register isn't called.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
