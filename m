Return-Path: <SRS0=KOWR=C7=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51FDC4363D
	for <phone-devel@archiver.kernel.org>; Tue, 22 Sep 2020 18:34:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A338320756
	for <phone-devel@archiver.kernel.org>; Tue, 22 Sep 2020 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600799641;
	bh=4+RV/uwNfuWjZ1pZHiQHtquWOdcsLIjpw1TDpWu6liU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=HVY5jXeOeb384VkcRSMk/KO7g4jzNEWkNfrAKiZ3b3zBg8/5pRNGsymSGdm8O36JF
	 sF7sM4hJKdyJcQAj4wUbgJoWQlZ6tXjnX/dZqyyNERlNRrhi9LHdcyR+MTcgwFHpmW
	 rkaEuIyqFeRRUZPLbp/+gzO5S8XWSxPZN6rm8Y7Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIVSeB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 22 Sep 2020 14:34:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgIVSeB (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Tue, 22 Sep 2020 14:34:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C45702065D;
        Tue, 22 Sep 2020 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600799640;
        bh=4+RV/uwNfuWjZ1pZHiQHtquWOdcsLIjpw1TDpWu6liU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oQd3FDM4HEmVIEZHbm8BLTNNnV2hEGLA8gjE/uwb4bp0odlWqhTT7pXUhSr8Krbly
         vR/gsiV+xWNKLelcxSQRhx6lFegaVB+osUegV7rOeTZ0KmkieBccDZyK0O8o9QBW/9
         bmXtLTi6xA84YgMmRKG+9TosWVULX/mxtwsg8iAg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200922120909.97203-1-konradybcio@gmail.com>
References: <20200922120909.97203-1-konradybcio@gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Fix wrong parent_map
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 22 Sep 2020 11:33:59 -0700
Message-ID: <160079963957.310579.17971187414769458107@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Can you send your patch To: somebody?

Quoting Konrad Dybcio (2020-09-22 05:09:09)
> This was likely overlooked while porting the driver upstream.
>=20
> Reported-by: Pavel Dubrova <pashadubrova@gmail.com>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Any Fixes tag?
