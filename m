Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE58C433DB
	for <phone-devel@archiver.kernel.org>; Sat, 30 Jan 2021 10:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE7E664E08
	for <phone-devel@archiver.kernel.org>; Sat, 30 Jan 2021 10:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhA3K7J (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 05:59:09 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:50040 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230170AbhA3K6m (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 05:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612004258; bh=whS05SjI/ZJcqckFcwr0XxJmx2yKN/7Vf8CO7ruzMN8=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=kjCtrDgd8+06tjV4cGEhePhrtaUXMtJ3ZWxzN3fTshJVK79ozq6CiZOXQH98dpwLI
         u8D5mihD0ZiYTfKIamudgyz6jQUL3qpJkQzUtPr0I7cjuoYn9bJ0BEfYZyvHpmdRc4
         zxslNeNH7MJ8j/BvNhdDT+HaaVVpBVZs6+gagAnY=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Sat, 30 Jan 2021 11:57:38 +0100 (CET)
X-EA-Auth: pj+zDgzOY6II64NJ1/FC4qeJu5Q355DppMimo9NhxXXRZ9Dy49gZuR2xkwkvoUtBomZDLaG9DA9vuaFsisOLKrZsJCjdiksHxAEW7DN8o84=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Daniel Palmer <daniel@0x0f.com>, allen <allen.chen@ite.com.tw>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add Alcatel
Date:   Sat, 30 Jan 2021 11:57:10 +0100
Message-Id: <20210130105717.2628781-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document vendor prefix for Alcatel

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 076d4b26261b..7b30fe135d83 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -59,6 +59,8 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^al,.*":
     description: Annapurna Labs
+  "^alcatel,.*":
+    description: Alcatel
   "^allegro,.*":
     description: Allegro DVT
   "^allo,.*":
-- 
2.29.2



