Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FEDE71D21
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 12:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjI2MX7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 08:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbjI2MX6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 08:23:58 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E855BE
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 05:23:56 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-533edb5ac54so13108489a12.0
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695990235; x=1696595035; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sla6wmpD1DUPXq81GA+Qf96ZRYBJdn00BJ+JAxCtCQg=;
        b=RDfYwL3iPdVBDnC8c57GDN+3kAlSFgn5Pk66grBMHHnzbWdvN2tFRo44knjhLxTt5C
         9Uh5rBzShfr2JTTiOhbqy7JkGfDaU3aNlfBMuKTuPl1EzvdmLXOH8+Zve8niBcasOB6Q
         4kWQNebEPoXfwLeYrGappNCQqgPnSyr5iG7/OVStx84oRhoPxGQ36W2o3TokPG/6hqBK
         tKAnHHkhrLP1PRr7ScmXkrGstwguOGQRLax7wKx3qz8LCt/octdtupAdDbEjGypZ2tMb
         n6bOIGxa1DTBEVa9t1U6r7hxFq5NPNFIlyMjc5f02hEjapJH3MumFYJKHUD3T92Pj1x7
         /HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990235; x=1696595035;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sla6wmpD1DUPXq81GA+Qf96ZRYBJdn00BJ+JAxCtCQg=;
        b=oB4172/8P5uXbcrYLoLjapZRjHgj8Jy3MkfbckxCyUd2M4rSHLJucAWd3cyIhTOv8V
         JIhMmPjJAXbfNKo4dIagVYuq5r8/B8JQLFVO0I+oC/S8zw2pCpDgmW6QnsIA4ZNikkK+
         KTMep1fXFMzFvcOf98UP1cDu+fU3U2H++pYpC/qKnwRQsj00PYt58cruSK1kCL+n/2m9
         ruO+VZaOlxcHFkc/njuMU5YcgL7b97wZOT0wgr3sWF8bcu2vo5olmyOMe5pfiu+ASUpN
         ScmZx6ZiI6uCCHTwdeJGVMhU2Vfel0ktMJvtgze11POpA9JfQt/geiFuBYzAJ4J6v5AR
         IucQ==
X-Gm-Message-State: AOJu0Yyz4EOQpQeRVaw2ZfYrHQG/vYXKuccpI+pA8N2OAKz38D0DM7c5
        2Fnlgx12wKcLHHVqL7jMt4yb5Q==
X-Google-Smtp-Source: AGHT+IG2kjzZLb1SdI6/JkmBGM33kigR2o+WpFZUGImV1UHmk2br8Y6U1scGw32/Vw2pa3JA1cAbFg==
X-Received: by 2002:a17:906:217:b0:9ae:3210:22fd with SMTP id 23-20020a170906021700b009ae321022fdmr3509603ejd.48.1695990234936;
        Fri, 29 Sep 2023 05:23:54 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mc1-20020a170906eb4100b009a5f1d1564dsm12209790ejb.126.2023.09.29.05.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:23:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 14:23:54 +0200
Message-Id: <CVVED1K40NK5.1MFHLQH8YS4IY@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add ports subnodes in usb/dp
 qmpphy node
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20230929-sc7280-qmpphy-ports-v1-1-7532c11973af@fairphone.com>
 <af19b32e-9e91-4829-8d77-9cf154e19bac@linaro.org>
In-Reply-To: <af19b32e-9e91-4829-8d77-9cf154e19bac@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri Sep 29, 2023 at 1:44 PM CEST, Konrad Dybcio wrote:
> On 29.09.2023 09:31, Luca Weiss wrote:
> > Add the USB3+DP Combo QMP PHY port subnodes in the SC7280 SoC DTSI to
> > avoid duplication in the devices DTs.
> The rationale here is to make describing the connections between
> certain hw blocks possible. Defining it in the soc dtsi gives us
> a very cool side-effect of not having to repeat this, but it's not
> the main point here

Commit message is copy-pasted from sm8550 commit with has your R-b ;)

But I'll change it for this commit since your comment makes sense.

>
> With the commit msg amended:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad

