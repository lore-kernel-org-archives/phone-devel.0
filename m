Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A25ECAAD8
	for <phone-devel@archiver.kernel.org>; Wed, 21 Sep 2022 06:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiIUGMS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 21 Sep 2022 02:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiIUGMR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 21 Sep 2022 02:12:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89C07F111
        for <phone-devel@vger.kernel.org>; Tue, 20 Sep 2022 23:12:14 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u9so11261887ejy.5
        for <phone-devel@vger.kernel.org>; Tue, 20 Sep 2022 23:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=lcpfMgoa9N5r9lcnt2RlUpWbc6msSc6IQloKQmZo7QU=;
        b=yzXRiYeez2V75KbyVbU8GwVQAu5zaLl3C7EGPOhDNQP0Wfjhfoj9Jj02Uvr85Qti+j
         6cVzGEsYxmrmKiXR+ojzSFk2skPlZKpQAVGEBD5qP4p/zZ7YV7AcsJK+KPJj2MKy9VuR
         rDtDeWVgdH8lxdHWrUkwI13EqXkF0iapWSE7aqW2G30FgEuhzPoCpT0E31pNmGCtl4Mh
         xboN5TMsfDYKjU+HJKaW0wXoqDHM3Z5BkkuHUn54zKmC4A26M8/I3JSGL30BvsYEAQfh
         ajmGjtSTP9GQTat98Wun4tQomtl6wNRDLL3yXENNcmtwN06/if9g8U5a+0eInCOOPnP7
         poTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=lcpfMgoa9N5r9lcnt2RlUpWbc6msSc6IQloKQmZo7QU=;
        b=QrkiOM2nfN/kOhW0yUZanKfaIbs0btqDdNIiTZoVZLrGPCaEZhd4xPoQu6Aayav9zw
         lj7k2rfORWyaUJh/i2Po4Cq8PwFma0pcfgPjrkTtYpY2z82PXZgHebvGMwEQx5UUxou8
         4jweeNpifppC3bXFIT+W0ulhQf4pKqHBdX8JO9EoZ2Lf7T53PNvpz1fy6HHldumUxi0W
         TTgjsANtcceLYvJOGlhxoaUg4z/+/WVJKL6GhgMvXIQbqGY0uUUWNWEg1xFwwB9uwNhY
         MSKIY0r9yjn1uscV1UmNIWOQ7HRezz8IdWAXuDkzS5Su1ykUcknSuVON2u5iHeGLW+uj
         +DSQ==
X-Gm-Message-State: ACrzQf3h7FrJTZQ33wgeuxtUQNbvLrY8NM80IxLan/rIq/oU8BSduKoL
        GeyC4iOsBv5R+Vlru4IE9mFpFRS9KgHhyQ==
X-Google-Smtp-Source: AMsMyM5DxnCWvp1MzGJ34gI4csKiVSg8hpAWNYpamSC7doET6MwhCDs47yqVYMepof5kAxk/cfuPcQ==
X-Received: by 2002:a17:907:a40f:b0:77b:b3c7:28b6 with SMTP id sg15-20020a170907a40f00b0077bb3c728b6mr19610878ejc.637.1663740733421;
        Tue, 20 Sep 2022 23:12:13 -0700 (PDT)
Received: from localhost (212095005231.public.telering.at. [212.95.5.231])
        by smtp.gmail.com with ESMTPSA id x14-20020a05640226ce00b004544bdd56a4sm1136595edd.89.2022.09.20.23.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:12:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 21 Sep 2022 08:12:11 +0200
Message-Id: <CN1UV8GZPKW8.3KT1X7WYEM4K5@otso>
To:     "Lee Jones" <lee.jones@linaro.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>,
        "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Caleb Connolly" <caleb.connolly@linaro.org>,
        <linux-kernel@vger.kernel.org>, "Lee Jones" <lee@kernel.org>
Subject: Re: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers
 lowercase
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.12.0
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <YylwxQSulh7C48T7@google.com>
In-Reply-To: <YylwxQSulh7C48T7@google.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Lee, hi Caleb

On Tue Sep 20, 2022 at 9:50 AM CEST, Lee Jones wrote:
> On Thu, 15 Sep 2022, Luca Weiss wrote:
>
> > There are some IDs that are written in uppercase. For consistency
> > convert them to lowercase.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Changes since v2:
> > * Split out to separate patch
> >=20
> >  include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> These aren't MFD patches.  Please reword the subject.

Do you have any suggestion what subject to use then? The most I can
think of is "soc: qcom: " which is sometimes used for other files in
this include directory.
I've used the current subject because the previous two patches touching
this file had this subject also.

Regards
Luca

>
> --=20
> DEPRECATED: Please use lee@kernel.org

