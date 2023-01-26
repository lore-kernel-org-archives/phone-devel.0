Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BF8C05027
	for <phone-devel@archiver.kernel.org>; Thu, 26 Jan 2023 09:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbjAZJJQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjAZJJP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Jan 2023 04:09:15 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E663E60B
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 01:09:14 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 3C8F15C00F1;
        Thu, 26 Jan 2023 04:09:14 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 26 Jan 2023 04:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1674724154; x=1674810554; bh=g6ATgqr0TN
        +x4Obdaq5z13CiMjUNSuLQ/IWMI5UhjQw=; b=GsjeYcq8LhhPBwn1zJE68Lx0Ah
        vONU242J3FZA6SfCo3pVxCHZh9D6hhYEVu3KUC6cxRvSYKdnzB/1U5GllXZQVcsm
        d94j7XFzTuF0MlgfY0Riv35BmRRSeRA/520iX2W9FjIVatty3MjZqtb2s2mwJKyz
        QMqTEMaiSklrxnZHg/kotbu76REFXy1sWE0ARG7jKEfLRmvMU8pXEGLQA8zHvWkQ
        Vckwyfee0DC9gRSiOgrZX+2FylokB5Bwk0l3W5rLIeHLDn/z/vDUNipetke2pbUw
        B5rcMMjGPl/Kf1SEvNHi2Nx35j7ZY+oyd4pbgk73Qo8KhMWeVkTCf7WI20vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674724154; x=1674810554; bh=g6ATgqr0TN+x4Obdaq5z13CiMjUN
        SuLQ/IWMI5UhjQw=; b=JiuDVXUWgsgA0IS5FKc5OISDgB9m7ZoQfxA/SAc/GXDl
        C0Ukfs7uZraUw7EInSttXWek6ewPlTtnb3eTlR2m8eRGNeuOtdUfeHIFiOza9jxo
        lnh4Jcs9jIA8PubftjPla9/RgV5wIiam6HwIAqRZu2aHTiAHnoOx68/vkZ3PMMp1
        KyCn8civtN/GvBaI8j0ZbVmeioIS4RAe6id5QOVl1Hn1OX1q/GVnoZwVWMXz/ITe
        1U5PhSZJO7Dy5Zb19MwmLFjAbeYMRubx1AYkaxbPZbT1AN/oSNCe2DH6DWqzcbto
        ATmXnZejCm8aytNfmvDidImHF2odXUizumQxVUk8fQ==
X-ME-Sender: <xms:OkPSY3ePdNuA1AbvbhhjpWm5Tg52zKlng_rMN_oQlfGXdDedXDyJNQ>
    <xme:OkPSY9MbMOWvhn0RGn-c6tEo7KiUFYCwgHwfZ4X2qlnDt4ZNJVaGPR6LO2ChHtCYL
    86q1JdRwNJckVDW1JY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OkPSYwjDX2YCJdfobSunG2WOt79nuOIjzFhQ8kFGdudQQQP2CSlvcA>
    <xmx:OkPSY4-mQqAJBhlKVYYBE7cYdEWuPBWUJSA4tM-X6Abh1WTb_w2TvQ>
    <xmx:OkPSYzspHeiLBBmBm7lIGufP7kbYEQ1HoNQbUW1u02lHwHcnxMxMWQ>
    <xmx:OkPSY84CsF9bn825QwHHjmcJcPCyV-u5UZx0Hm-FrzC8S-_Lenct5w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0644EB60086; Thu, 26 Jan 2023 04:09:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <6b53a127-4529-4283-be4e-1724de98fd37@app.fastmail.com>
In-Reply-To: <CACRpkdZVH8nu=4a4MuQZ=uUpqg1MBXShCU_Bm3CUxPg1adO8BA@mail.gmail.com>
References: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
 <CACRpkdZVH8nu=4a4MuQZ=uUpqg1MBXShCU_Bm3CUxPg1adO8BA@mail.gmail.com>
Date:   Thu, 26 Jan 2023 10:08:51 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "SoC Team" <soc@kernel.org>, arm <arm@kernel.org>
Cc:     "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        phone-devel@vger.kernel.org
Subject: Re: [GIT PULL] Ux500 DTS updates
Content-Type: text/plain
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Jan 25, 2023, at 23:18, Linus Walleij wrote:
> Wait!
>
> On Wed, Jan 25, 2023 at 10:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> Linus Walleij (2):
>>       ARM: dts: ux500: Add eSRAM to the device tree
>
> Now I see there is an appropriate "mmi-sram" binding in
> Documentation/devicetree/bindings/sram/sram.yaml
>
> That's obviously what I should be using for this.

Ok

> I took it out and pushed the same tag without this patch.

This results in a warning from my tools that notice the commit
ID in the branch is different from the one in the email.

I pulled it manually, but if you notice something like
this again, it's better if you follow up with a v2 pull
request. Patchwork should notice this and mark the first
version as superseded in this case.

     Arnd
