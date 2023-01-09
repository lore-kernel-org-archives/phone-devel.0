Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B516CC67871
	for <phone-devel@archiver.kernel.org>; Mon,  9 Jan 2023 13:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbjAINmF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 Jan 2023 08:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237202AbjAINlX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 Jan 2023 08:41:23 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875D413FAB
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 05:41:07 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4b718cab0e4so112827067b3.9
        for <phone-devel@vger.kernel.org>; Mon, 09 Jan 2023 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wb+6yb9R61KlmNa9GN1pcRJN6n/iQC03fh18uG53PKA=;
        b=swT77g+So+NgP7caEaJ6O9ceSvAdYk+grZZiOdQV8nih+XkgHPW7A1TWMvnMwHbSNC
         XqAtNGmfyio1WtOyZIRvGcgGb2eBRASgE9G+7Pw2dyezmZQmG4dfWaSr6fUhcs0/KT5v
         +JV7tPij9h4iR3nAu8cOH/6K3NPmKzzsiLM4Z7CcEOYIhm0wRBeKCHnRA44v2/GbdF4b
         7bSlU7Az9OQa5+N6lSzPP7L8iN7RhBvi08OPLMxBU6QZyQJ6/l7gUx2Snjw2EG9jAv4M
         sgFVwN2VeGNFDSGNLoNjdxOFJt07YngBnF4zOEI0++UbrxFkpN/QsO6MEzGwRuxoKLlB
         emuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wb+6yb9R61KlmNa9GN1pcRJN6n/iQC03fh18uG53PKA=;
        b=SiBncX3dmI1Bi612jrJ53reZhdtJ/yRTfpGVtMk86l4SSpR+/einr2S3zvOk/y29Br
         sEErvVvQHN3zFDKpcvmKRK0XDAXi8K5Fbor5vqnr8ODPnI5dtPPy/L4u7n5YfFOjZ4oI
         rAzBXu2ZnPNvL2NUQYT3AjXBOAQjawStI0fxDEGruqiRfNMzfYajTQ0hepMki92wxyuz
         opsZuDKKf+pEdiiAkrf7frNH5vd0ClzTs3OjCzJlPRFAjxdv2mDVL3HsPDWOCJYKHnt7
         8Up7uEqi4fL/lxJf/3RT5ls5mnOYKhrHe32dngjWafRWObaIddB41MgKQ7LB6dFlF8ip
         i8gg==
X-Gm-Message-State: AFqh2kow2e2YC+EuWs8oPhLQBx5GqlRvL8/camiJT5b9RVYBBP9mLRzj
        5PULyRkhFe0psinYdrxwZUGdPTYdat/R2vkM9fN04A==
X-Google-Smtp-Source: AMrXdXuJafcJBxWgNG3iDYwIGn5e2BoBODHe1CP6aoQRnVBj1JCScwi0X3vdopUmL/zUqBF2EfnzZsWU+EzxIPXPaS8=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr1495965ywa.477.1673271666804; Mon, 09
 Jan 2023 05:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20221231164250.74550-1-a39.skl@gmail.com>
In-Reply-To: <20221231164250.74550-1-a39.skl@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:40:55 +0100
Message-ID: <CACRpkdZoU8AXbQ7QDfuf6yUTZFPDE-L6ZLRB8jE-KP4YqbHpXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-msm8976: Correct function names
 for wcss pins
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Dec 31, 2022 at 5:43 PM Adam Skladowski <a39.skl@gmail.com> wrote:

> Adjust names of function for wcss pins, also fix third gpio in bt group.
>
> Fixes: bcd11493f0ab ("pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Patch applied!

Yours,
Linus Walleij
