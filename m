Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8801BC433F5
	for <phone-devel@archiver.kernel.org>; Tue, 16 Nov 2021 11:57:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 706C16142A
	for <phone-devel@archiver.kernel.org>; Tue, 16 Nov 2021 11:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhKPL75 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Nov 2021 06:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235581AbhKPL7j (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Nov 2021 06:59:39 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2429C061767
        for <phone-devel@vger.kernel.org>; Tue, 16 Nov 2021 03:56:41 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u1so37031120wru.13
        for <phone-devel@vger.kernel.org>; Tue, 16 Nov 2021 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tykKfzZRZs8W8LB8dDzw5i3CD5rhrU5zWD1WHrFGu6I=;
        b=PdFx29zeOFtKWYfkjdFXu4FzngjheOfZFBdUnmdD06TBxqyhoP6ZiWipqG8zf5x9K5
         Zk/t5mwNF7kmhQ+x98VH6LWeOs4ba9wDFEdZQ4vAan0vTm4HNF+cH013ecdNxfv3/w2y
         Y/G/U+1hr4yNWe0jyu2HzBrH/b1OxP8Nw/r7bgQjDI3vq0eGP+tuYkgALS0YS7LiCsYv
         /4z7Oi7UR2jJs2oMtIIDa8MTnoL+UKxaoccn2YEkC3gXvBxL67XBhKJOc6yxemkZRcnN
         c24vxX82rD3hgOG4IxBEfTTcuVB/r/mUJvyZIsuMLNQDdFjNiFJbaq5WVtrksKSDpiAv
         DWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tykKfzZRZs8W8LB8dDzw5i3CD5rhrU5zWD1WHrFGu6I=;
        b=PLACJlSk9a1xJrN8+xTp9i06HYAl2Mv5SrzlS/CUxx7XOTb82Lghwvs+AacB/UB/s1
         Dzv34yiAj9tGfSoII8CuCnnzhe7AiRE91meO3cpcC05L02EIwBpxqPYHd94llmOo0tXB
         U8H15yFuMW2HuSoz+OzkBZNGIn4ldlPfEWIGMnSuq8zILqIPXZc2nElhWOb+vLdf92jn
         5BPRFM2oxZBINXBN4Czom5cS1WedG20v+mgWJQa7IN8WWRkywTUQZML7Td1QP9f4fvMZ
         t3Du8lFwOH7Koc9428Q9w90nX7jC9nA2buj8EwYEPIZsOf6cFlfET9SmGEVHsSIwou1F
         s8jA==
X-Gm-Message-State: AOAM530FGHS/PnVupismaKChjBnroxwx8zTPOfH+cuW1+kMqr6j8FUMc
        TCR/ZKsFZASsXO0f3yMjYCwgzw==
X-Google-Smtp-Source: ABdhPJx+DsVIlJi3qFUEgUdKvjqrCDE8LrH3TXHbTDv/qIgV8UK1fSvVa2mKOiRmfZXNdh/uzdkPpw==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr8549336wrz.231.1637063800263;
        Tue, 16 Nov 2021 03:56:40 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id m125sm2157270wmm.39.2021.11.16.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 03:56:39 -0800 (PST)
Date:   Tue, 16 Nov 2021 11:56:37 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 3/9] backlight: qcom-wled: Use cpu_to_le16 macro to
 perform conversion
Message-ID: <20211116115637.22v2pluxkni36ehr@maple.lan>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115203459.1634079-4-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Nov 15, 2021 at 09:34:53PM +0100, Marijn Suijten wrote:
> The kernel already provides appropriate primitives to perform endianness
> conversion which should be used in favour of manual bit-wrangling.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
