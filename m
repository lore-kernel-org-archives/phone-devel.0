Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0D0C43217
	for <phone-devel@archiver.kernel.org>; Wed, 15 Dec 2021 22:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhLOW2F (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:28:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbhLOW14 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:56 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD22C061761
        for <phone-devel@vger.kernel.org>; Wed, 15 Dec 2021 14:27:55 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so26691263otu.10
        for <phone-devel@vger.kernel.org>; Wed, 15 Dec 2021 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSEG16yJ/pZVc9UBuEcTPFQBGiKuZZcjhlf9WtuAprs=;
        b=cuEcS1f5g35wCAwpC5X2/A93NKMe8/dYHwlIVfoQh6owdqbODcYuIr+4FD4dwpxxuj
         3c4nTIBn4ol2oBNciDmCfS8LRdUwLkmXWUcBA4Biz/XnVxShgPulMmTLPVhXJrHptetn
         0w3VX/GxT0cS1glMYSATSJQ/BDMUfm9UDxyEE8gwgkjr69pVxsh9R9EX9nSYkzGco4RW
         rVJpOG20sDPQX5ov1i+/YBzD3PbUSD0p2Gn5eaIIsehtuPSyjAivNHKfEGTddGHEWhja
         sy5M0D87BoaBC/cdos2X90QTEHl21CzAzIvE5V3KBeJzZQyTBTvkoZujwIO4JrPsA5Gd
         i9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSEG16yJ/pZVc9UBuEcTPFQBGiKuZZcjhlf9WtuAprs=;
        b=KCXx4Adbu9sO6GedsNfL1uF4XhDd4dD4tyUJFAqGItcCobzxklhYnuokHP9hXTd7G+
         x2N0+7DLqrZnV/7J1uIWFQ9cSpzGJdmIlryqpolMGQfBMy4L58uP6S/TBq5le45qJ7FA
         ODvQXELM01pgCdn89O2NV13A5waoUfgd0JntZOCja+Kbb2I3VVVlDRFvwEVO1p31eZdE
         fSi7oclLJMcc8DjzKM/NWplErELvZOlUekaFvp7ncVfmEpMpYgcBaZM8SWwPI4W7YkFA
         vRz3PtJ4Hrw7fOFCkQuXQKHItGei4POkM9b+64eFxDtwtsJonMuiU4WpAKoz1LMCsbGf
         t2pg==
X-Gm-Message-State: AOAM531XIHv2WyHJYnuAgxeQ3hMkEfL1cNz3KXHgl1w/VRBv19Kkc4Q1
        2gy9JNyiqv2ha6G04futOypM5w==
X-Google-Smtp-Source: ABdhPJyV9J29rkDfyYTATPFl2Aq7tIcKmAPdfUnsZsTx42Bdm8EG8ZQUy8tFpSqskGCJ62zkRjq/Yg==
X-Received: by 2002:a9d:77c6:: with SMTP id w6mr10764181otl.155.1639607275216;
        Wed, 15 Dec 2021 14:27:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:54 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: (subset) [PATCH 0/8] ADSP/CDSP/MPSS support for sm6350 and Fairphone 4
Date:   Wed, 15 Dec 2021 16:27:27 -0600
Message-Id: <163960723734.3062250.7617983608039138619.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213082208.21492-1-luca.weiss@fairphone.com>
References: <20211213082208.21492-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 13 Dec 2021 09:22:00 +0100, Luca Weiss wrote:
> This patch series adds support for the remoteprocs found in
> sm6350/sm7225 and enables them on the Fairphone 4 smartphone.
> 
> Luca Weiss (8):
>   dt-bindings: remoteproc: qcom: pas: Add SM6350 adsp, cdsp & mpss
>   remoteproc: qcom: pas: Add SM6350 MPSS support
>   arm64: dts: qcom: sm6350: Add MPSS nodes
>   remoteproc: qcom: pas: Add SM6350 ADSP support
>   arm64: dts: qcom: sm6350: Add ADSP nodes
>   remoteproc: qcom: pas: Add SM6350 CDSP support
>   arm64: dts: qcom: sm6350: Add CDSP nodes
>   arm64: dts: qcom: sm7225-fairphone-fp4: Enable ADSP, CDSP & MPSS
> 
> [...]

Applied, thanks!

[3/8] arm64: dts: qcom: sm6350: Add MPSS nodes
      commit: 489be59b635ba76ea16d6f820ddf037644b3415a
[5/8] arm64: dts: qcom: sm6350: Add ADSP nodes
      commit: efc33c969f23cd6fe983e7e7bdcd8bbb1521f1de
[7/8] arm64: dts: qcom: sm6350: Add CDSP nodes
      commit: 8eb5287e8a425aa7b27cfbb92096550046a231f8
[8/8] arm64: dts: qcom: sm7225-fairphone-fp4: Enable ADSP, CDSP & MPSS
      commit: bc279dc04e9ee23f6a22f6c7a6924edbd5fe0f6d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
