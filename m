Return-Path: <SRS0=mJHj=DD=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D51C2D0A8
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 13:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9FD120882
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 13:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvqFeVCo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIZNeF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 26 Sep 2020 09:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNeF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 26 Sep 2020 09:34:05 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBBFC0613CE;
        Sat, 26 Sep 2020 06:34:05 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i1so5373581edv.2;
        Sat, 26 Sep 2020 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=BvqFeVCotSaqa7RGGS0JmscAfUY4RysnR3noNuQ3CDIuwAQthuf73oQd5AnU38gOJG
         4BsgP817p2kpk34hBPQrjrr7/ZSfRjxrgaT3TbWcZyV96Bs5M/OrX+jVs5xjOadvZP79
         Ih23VWkferfUeCcUBZcAtpC2H+9xgnaN+jmbdGbsJxVRr8QL+pVmcev4xHpG0gMqKoR7
         1A294MxjJ4dnxCFnS0Hdf9yVnPx5J6Am2us2JR20ojMeXgMZQwtBu9//l27cMezMTLfn
         UJcjlQL2Nsk50umNhwcgb+2OqhTyYWhG83D+rm1uuf+Gtk+MPPmsxgE+dfzS0aU6ZrOi
         4e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=tYFcF2CUZGAR3dEFa78GPcpRUguJ47V3REOOq8hNwKjdoxr2T7BmtNdFDdYxLIUzM4
         dtbl/eZaWcayVkPFbuJYh44lNyQucsifhvrhGl5Ws9PRwbJyZXrRSTbWKlZCUGbUzuST
         bO9ZBMJyrMennkru4xFx9wBWR0mQomjfciuOuqDnPPZJtmAnXQxMVlJ21qPMPTcZAG1l
         RVBg8ixC4McDwsEC/j48PxZvD+unBDHM905iRQ+uZoVigVZDWN0dbjYn4ySfZ0h8dlfH
         fYtVN1P56zkVXnPan7IQEpkhCVI5mZsJ1zwoIFcngbApi95gWyas8+P9EjxGNjq7a31q
         atUA==
X-Gm-Message-State: AOAM531Sy569IRbd62WMaYky9MUftbjgi2jA4ydXCsi4p4EZ6Pk8pbaF
        hz8fnUiZc5ELWRRRWmqsBPHWPOIJLKKyqMp2MsD5MFxRPEY=
X-Google-Smtp-Source: ABdhPJyrAgk1BkT1xIWuRM+4Hpv0cVYqQJRI/0RSH/uVvHjLGYd+gzUDaIx9EfToeqsk3WWxEQy+QGfRWF3zjohMSEQ=
X-Received: by 2002:a05:6402:17fc:: with SMTP id t28mr6628569edy.244.1601127243771;
 Sat, 26 Sep 2020 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com> <20200926125146.12859-4-kholk11@gmail.com>
In-Reply-To: <20200926125146.12859-4-kholk11@gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Sat, 26 Sep 2020 15:33:52 +0200
Message-ID: <CADQ2G_Hk9HweukaYd29JXi_3hxpVTLkcu-3F8qJEZL9h0yrPSw@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
To:     kholk11@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jcrouse@codeaurora.org,
        Konrad Dybcio <konradybcio@gmail.com>, marijns95@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Tested on Xperia 10
Tested-by: Martin Botka <martin.botka1@gmail.com>
