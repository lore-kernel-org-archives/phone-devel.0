Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BACC00140
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jul 2022 20:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239517AbiGZUle (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jul 2022 16:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238984AbiGZUld (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Jul 2022 16:41:33 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DE7371BD
        for <phone-devel@vger.kernel.org>; Tue, 26 Jul 2022 13:41:32 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id f14so11963283qkm.0
        for <phone-devel@vger.kernel.org>; Tue, 26 Jul 2022 13:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jeFixDPfE71QMWfSEPLhQ0hQsRonHTELVwxWS7yvUS0=;
        b=S+jU8whJE0OvzGwWSxD5K+sb9CCgpxmMPNl3HkH9OF5g+tDFnVlXt5BLvj8e84b3Qe
         5S6vZn70agIERKmCx6f0GW88foe8CyXNQIRXMlFBIL3h4B6yTXI01h459azQgealo8H4
         Leh/QJZDIT/tCyFzWGInBK7PgoMYtzL5V5Xs8Af6DLJNA1sU5FlOhnl2QsS99r28yt4T
         +Rz/xGsA6poNidUpQcScZh9XrgGitcZcW1yCH/Dtct9CtYzuYD7m2A+R3P1D1v2hEGkk
         fUVZGtOByijdRka3XQGtreGsRwNg4/NVSmy5AwkRX0CGSSxt750ezLbZuCAqMfGfxo+1
         MaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jeFixDPfE71QMWfSEPLhQ0hQsRonHTELVwxWS7yvUS0=;
        b=rxIVJ3iqzd63Qb3r5T6UJxZXQ7IGyGYJXdsXmXymkLftnNBrPaDlIs5C+lJEoMj6ex
         2XZ9cuRQq9u+jkxlT6mdeoFPE4Y579pTGATFkjr8wRrRAJki8dgQ/PKFv9iRDpsawfB9
         OQ7wPu3oPeTWZ9peY8lYkV9Z3e/Rx6p3ctpNkYDUVq5vHAWdWBSfCQz9cnLxpSNTmVnn
         Ring9JYgGYeGfL4bPRyRapEphwt5NLVUMqLfEdoAJOPLD3YZBAeAbzpXDsEBrDOxamQj
         X10OBL9C0FtiJ4k7Q7Rg3RlFRPHy3e6gTZ6NBCgiTqRNZfPh016+cHWM9NnhxE6y5H/Y
         hLTQ==
X-Gm-Message-State: AJIora/pmmFW2MM5MnTyKQ5Xi609VdiXdz1zJA1ivoFeXCdu7WzZmGx6
        cJRZEyOdNGmvqZpUufYUz8Ps3pUkTL4PeknEuurYxw==
X-Google-Smtp-Source: AGRyM1ugGeT6HXgm2s+CocGaha1OabRyGGWhYG97BOhDTu1yl9LfJKCkKayV4hqWRGe4iSsuMxMlD26zXuCNKOjEhKk=
X-Received: by 2002:a05:620a:4305:b0:6a9:3829:c03 with SMTP id
 u5-20020a05620a430500b006a938290c03mr13519778qko.363.1658868091261; Tue, 26
 Jul 2022 13:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220726181133.3262695-1-iskren.chernev@gmail.com> <20220726181133.3262695-5-iskren.chernev@gmail.com>
In-Reply-To: <20220726181133.3262695-5-iskren.chernev@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 23:41:20 +0300
Message-ID: <CAA8EJprtwN8OJAuM7XwTAWWBa2y71T4AmZxb+5TUnRdvZvnQTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] regulator: qcom_spmi: Add PM6125 PMIC support
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 26 Jul 2022 at 21:11, Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> Add pm6125 regulators and their sources in the QCom SPMI driver.
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Please fix the order of sign-offs.

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
