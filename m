Return-Path: <SRS0=mJHj=DD=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A955C2D0A8
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 13:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39B2E207EA
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 13:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPg3EKwK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbgIZN3k (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 26 Sep 2020 09:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgIZN3k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 26 Sep 2020 09:29:40 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB744C0613CE;
        Sat, 26 Sep 2020 06:29:39 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t16so5335627edw.7;
        Sat, 26 Sep 2020 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=NPg3EKwKtGNhoVkUfORKAqwc9fyhJKWIJJDtARpqzL3U68p5THQB7fsgXQtr1L+2bm
         eNkpIB5Z4DXzxcp/gqkIED1HSiavGCrTA0ZRW5V1dEKr7WYRJPt6goXYznPuOhFBjMtP
         3WRO3hRSzCTksqrA0yB6DEoudBTalxYFEiykOXqNobqu/9FlxrCHjrM24DQtPBQ+cqAU
         D09TV4KJj47vRNDekijDF77tZS/UwtoJZsh6uQeX0e6aFAdvcU3MdnR6w+ZTPsi2+9e8
         i0sqNG9UtSrR/TxeC8Nl9yTmp1GNLBSAeCELbNjmR8TUlgNbq+vIbTKTqlOXgoabLJKQ
         /ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Pw2334Ivc2sWGxKj6eRmrpO/w0k8YeD1ECz1yaBwKM=;
        b=CRxB5+yFzBMH2YvHUdYNieq4cDo9PTRx1Zwy6L2B9gDE0WiZmvNjVdW0WvLR6a+lym
         vZbA4LR/lRDhcbIBNDmAskRLAjkyWhsASgAJdLpK10QJHYcDAcRp2fv55d3ufdKJTLnD
         FdqyAwLa2aeAAe3avjyTfYyBiIgWqsGFym3FDLsggt68v8fG0OZJzLaTBeiuHA3BXKIl
         g7+vGs8TCRD/Zj7IDHJdCqwdAGkytLSm27TiMoIGkFuD9MCddt00PUxhmQreoB2lEUyQ
         SfAbeTN0M5Ay15HQrd7iGYx91I/Bgmlx1nsG0z2pGVxozUNu/T3gWsZqedA8+lpXep57
         zyvg==
X-Gm-Message-State: AOAM53138WZ7XvyMTjmqZT6IULlwQuwh5KeMygC4ZBkmZvZJ8Smrnt5t
        XTpfEADPpUAvt/VddWFr9KVhHCsuwCIGXhi1k/4=
X-Google-Smtp-Source: ABdhPJzWS8uuw4VVKH4hnpfoa9po5dytz6KsHjYi6rc8e2X/2rY5tRw5eFQ+zjOgT94pRh0FNZTv4/F5zQh9mQ1MWMQ=
X-Received: by 2002:aa7:de82:: with SMTP id j2mr6881751edv.3.1601126978547;
 Sat, 26 Sep 2020 06:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200926130306.13843-1-kholk11@gmail.com> <20200926130306.13843-5-kholk11@gmail.com>
In-Reply-To: <20200926130306.13843-5-kholk11@gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Sat, 26 Sep 2020 15:29:27 +0200
Message-ID: <CADQ2G_FVnBhMgsTzrEoxhnTerasiKkHA5eojv=yFYaBFZRbmww@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
To:     kholk11@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Tested on Xperia 10
Tested-by: Martin Botka <martin.botka1@gmail.com>
