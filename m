Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC2337B8F
	for <phone-devel@vger.kernel.org>; Tue,  4 Nov 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268317; cv=none; b=JRha1ANY7sRkXGqec0w5JSt3ghMTdvORht6HtuitHkhpYtN11wTYcHRJQVRs3pRaPDBah18iqAGUsYNYQLI/vqKbM8Bj/siUEKKSs1G8gDxITHaN4KYAiwsFDh6bnzl3+NLYGq4ZLqLSQlf/5P1N3Oe+MZqoPPQBVC7lLxPycRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268317; c=relaxed/simple;
	bh=L76xdvvOEFZa8rWKgn4/ATTYpvb/4aGcJBo+4mgSml8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUcFLwRebWKBpYI3jc7P1pWC46WYFia/g8KJhotWjP0XV12rHJ+zFQOMWEkqkrB/IC2wVKFIB4GAmIsLnZoBO3wIrTPK9ioRJI2kbqk74m+0Ykcw4dWRTlF+WX6ohB6xgAxUicq8dhhJEO84q+6LW3jCf7z2sUUu+YtHj2wi6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD11/gRn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD11/gRn"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so4420163a12.3
        for <phone-devel@vger.kernel.org>; Tue, 04 Nov 2025 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268313; x=1762873113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn9RtT+TK10aU6RMAshP1RXKAGM8AfGQOsHoDA4AyDM=;
        b=QD11/gRncyKi2ffU6w9O0dR8U0AAq0b4xRNkuvNN0CQIdONnFUdRyQSKbJsYjOxqhS
         Gm+/Pg9eHdt71rlFvXxcomqRFWV+ksYEGVhZNhHSDvqpX6HqSsh3kUCLyWLB54rN/WvH
         QuQ6MBApmfAzmpVatZ+fyLs4JVFDz9OfjcUbEPAyACwgXLKQ3JUfnlVc7ks7n1YiOfFG
         gbHM79QZ6h6guMLPLkd20tLk/SVaJals0F6Qyns3G6fkfhNUJFwXCsTJ5iyTxqaPJ617
         Cq8yy998bdAXfoX8sv5O1ewVcrymqD0hfwGojxvUJtVrGp1OtK405jVqJFzvjgR+xJyc
         qvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268313; x=1762873113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cn9RtT+TK10aU6RMAshP1RXKAGM8AfGQOsHoDA4AyDM=;
        b=MEHE2KSgdxoDy4UVTS0y+UzIqB1NrSVXhOIwU3MAjzxa0GQwrPm+uyHxPjRx4jb0pO
         DDTxMA2P/y4i3qhkEsWLZIG+oLpjNW5bF019M8QkZmpDBhOaNLT/j9KyIbSFnR0NXOre
         XV2h12XggMrZ8RAgIJtJ4wYNcA7keLT6a+8LLsGA8BNWhcA7uk+pRLFfk9b0V0G6A2h6
         M+yljjLQbv6R+cX6No17m5DaY4nGYDFWOungSUeYTTWMHysV9sEosGuZbZy54H5RIJkd
         YNEbkE/1sMhuphLRYfgo7yAvfE/W+srts6XLURY2MTk+dWzxDFl2vbjVFiVzfgBBlj7o
         sowA==
X-Forwarded-Encrypted: i=1; AJvYcCUyOPeQ/4FUo95zKR4Qr16TdZI1U+4JKq3eVmJwE2lmPBaRm52dHvfcl70LAh1NYIIZRg7CuMuWqwmsJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6sTtBQCEWmhanHrppNFEGJX9GbQQOAO/2R3Kpg7/vj1sIlTv
	DJ7+OYcc/dR7UAjdDpcQEigzgWATxiE9+h0OC3AHACKokKtyE1zdxnRq
X-Gm-Gg: ASbGncvQOHEuJCRpAbgyAiCtg6wyDjZ6V688yUd+PL++AYnUXUbKljyTd07kjGYk9yC
	LbI9oNGhGG64H963OZEcBtuPUuMMNfIwYtnICYB997eeQr8KJeakMCZqkTb7inZsHGJbfC1Kvxa
	RHjkFf/t4aJy0nKneBp2GRlNfnJLHDs7XY7Ng0TaIibdgXA+f5YsrcBF+q4rvScQ5jQ8cZ29Usz
	sBtXplJWQIbBIEmCnHRNGyaILEc0lNYrtBsYzIWUg5pKqzfAStJxivI6yW6f+KXUtKBkOLmBO09
	6Tc78ZQmn/NsAUG8cr5xKfsgi+GZFRdd/wrQDVWOme1AqAxz9dp89jrDecp5AZ/BEqltUPBLzYp
	qQpCTSL+dYiJ/5SuW/1ODmghcR+oyqA385v2ivBXjQ9mdfRvKKP2O0TyWS1Eu9FWenR5qxKpeXv
	0MY71ORb25FoCY6kr8mYC1kp0+opdg3QJMLpR4XcaRzcbCugg=
X-Google-Smtp-Source: AGHT+IF3qgP+8XqO0yq8vsjqhgYJ4oz0XliS1PQWZikyuvayCWl1BdhCH8DQPJaPzr0kwFQJ+gJzCw==
X-Received: by 2002:a05:6402:2102:b0:63c:4da1:9a10 with SMTP id 4fb4d7f45d1cf-6407704018cmr14220056a12.31.1762268312661;
        Tue, 04 Nov 2025 06:58:32 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:32 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:23 +0100
Subject: [PATCH RESEND v7 5/7] clk: bcm: kona: Add support for bus clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-5-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8542;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=L76xdvvOEFZa8rWKgn4/ATTYpvb/4aGcJBo+4mgSml8=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSO0ERti8Vv4pAY8+UJgZRISMEA0x/ogEx9g
 pSo6OJIi9uJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjgAKCRCzu/ihE6BR
 aMKOD/97R0C4V3jafzKBYgXkeIIylCtcP5w1zkzGA4S2xF8vydT9+hVSbgWY6SnHOp5S3s6P0zz
 MZaCagukQdVUqxCrvd8UnhSUnYLza1yox32hnWKU2iHrRNGY4411wNuTwkMhQjgTMkjP2cCtE42
 79tmiSX4ABAjytd207HCloUyN4q+YK0xamgyhMGIkJO2oQe+k+ncp9tTBfvvHK0kv6GDoSuH47b
 GWhImuMVX8wRThr4vSYRfGlM7NyLQSAMW/6QquD1KF33AivxxT+m4EiOZIWf3HL0XlZjYhRxydM
 3ABAD8npF2Owrv2NYQW6LAA/sLQlQjfJtXEka8WBEh+wbahp/yJlMRZGEWZgCP62F4NGwEJrJkB
 zjfC/7hrSmeCrN7UAGYVVajxcmDqB8mohH4ikYLUFSbucIyBm4Ry+nsbejQyAPXAEyOAxYk6qGW
 oWLE8oZvnNw9QQkkUgG0RC9q3bN2NVbYoHiPSheA8nc44Ej9EB4ujjaiSoQY8FMEP722gPrG2wv
 aBowNCXscy0Cv3Cdvb9Nw+w0y7WXdaQfgWnj2ycsgWgHfDatElbnwb4kaknLkbrUgFu4l+zOoaJ
 z3rH2G43I/4iU7tS90mZncovCivbfm7fEUDLy8ZpkXiEvjpKGxyauH8EpcibxDJJvLwAbnHsNl3
 N4UEw5Ck9seq4Ww==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Introduce support for bus clocks into the Broadcom Kona common clock
driver. Most of these functions have been adapted from their peripheral
clock counterparts, as they are nearly identical (bus clocks are just
much more limited in terms of allowed operations).

Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Made kona_bus_clk_ops const
---
 drivers/clk/bcm/clk-kona-setup.c | 116 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/bcm/clk-kona.c       |  62 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona.h       |  10 ++++
 3 files changed, 187 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index 338558f6fbae..8b6123e188fb 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -167,6 +167,58 @@ static bool peri_clk_data_offsets_valid(struct kona_clk *bcm_clk)
 	return true;
 }
 
+static bool bus_clk_data_offsets_valid(struct kona_clk *bcm_clk)
+{
+	struct bus_clk_data *bus;
+	struct bcm_clk_policy *policy;
+	struct bcm_clk_gate *gate;
+	struct bcm_clk_hyst *hyst;
+	const char *name;
+	u32 range;
+	u32 limit;
+
+	BUG_ON(bcm_clk->type != bcm_clk_bus);
+	bus = bcm_clk->u.bus;
+	name = bcm_clk->init_data.name;
+	range = bcm_clk->ccu->range;
+
+	limit = range - sizeof(u32);
+	limit = round_down(limit, sizeof(u32));
+
+	policy = &bus->policy;
+	if (policy_exists(policy)) {
+		if (policy->offset > limit) {
+			pr_err("%s: bad policy offset for %s (%u > %u)\n",
+				__func__, name, policy->offset, limit);
+			return false;
+		}
+	}
+
+	gate = &bus->gate;
+	hyst = &bus->hyst;
+	if (gate_exists(gate)) {
+		if (gate->offset > limit) {
+			pr_err("%s: bad gate offset for %s (%u > %u)\n",
+				__func__, name, gate->offset, limit);
+			return false;
+		}
+
+		if (hyst_exists(hyst)) {
+			if (hyst->offset > limit) {
+				pr_err("%s: bad hysteresis offset for %s "
+					"(%u > %u)\n", __func__,
+					name, hyst->offset, limit);
+				return false;
+			}
+		}
+	} else if (hyst_exists(hyst)) {
+		pr_err("%s: hysteresis but no gate for %s\n", __func__, name);
+		return false;
+	}
+
+	return true;
+}
+
 /* A bit position must be less than the number of bits in a 32-bit register. */
 static bool bit_posn_valid(u32 bit_posn, const char *field_name,
 			const char *clock_name)
@@ -481,9 +533,46 @@ peri_clk_data_valid(struct kona_clk *bcm_clk)
 	return kona_dividers_valid(bcm_clk);
 }
 
+/* Determine whether the set of bus clock registers are valid. */
+static bool
+bus_clk_data_valid(struct kona_clk *bcm_clk)
+{
+	struct bus_clk_data *bus;
+	struct bcm_clk_policy *policy;
+	struct bcm_clk_gate *gate;
+	struct bcm_clk_hyst *hyst;
+	const char *name;
+
+	BUG_ON(bcm_clk->type != bcm_clk_bus);
+
+	if (!bus_clk_data_offsets_valid(bcm_clk))
+		return false;
+
+	bus = bcm_clk->u.bus;
+	name = bcm_clk->init_data.name;
+
+	policy = &bus->policy;
+	if (policy_exists(policy) && !policy_valid(policy, name))
+		return false;
+
+	gate = &bus->gate;
+	if (gate_exists(gate) && !gate_valid(gate, "gate", name))
+		return false;
+
+	hyst = &bus->hyst;
+	if (hyst_exists(hyst) && !hyst_valid(hyst, name))
+		return false;
+
+	return true;
+}
+
 static bool kona_clk_valid(struct kona_clk *bcm_clk)
 {
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		if (!bus_clk_data_valid(bcm_clk))
+			return false;
+		break;
 	case bcm_clk_peri:
 		if (!peri_clk_data_valid(bcm_clk))
 			return false;
@@ -656,6 +745,14 @@ static void peri_clk_teardown(struct peri_clk_data *data,
 	clk_sel_teardown(&data->sel, init_data);
 }
 
+static void bus_clk_teardown(struct bus_clk_data *data,
+				struct clk_init_data *init_data)
+{
+	init_data->num_parents = 0;
+	kfree(init_data->parent_names);
+	init_data->parent_names = NULL;
+}
+
 /*
  * Caller is responsible for freeing the parent_names[] and
  * parent_sel[] arrays in the peripheral clock's "data" structure
@@ -670,9 +767,23 @@ peri_clk_setup(struct peri_clk_data *data, struct clk_init_data *init_data)
 	return clk_sel_setup(data->clocks, &data->sel, init_data);
 }
 
+static int
+bus_clk_setup(struct bus_clk_data *data, struct clk_init_data *init_data)
+{
+	init_data->flags = CLK_IGNORE_UNUSED;
+
+	init_data->parent_names = NULL;
+	init_data->num_parents = 0;
+
+	return 0;
+}
+
 static void bcm_clk_teardown(struct kona_clk *bcm_clk)
 {
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		bus_clk_teardown(bcm_clk->u.data, &bcm_clk->init_data);
+		break;
 	case bcm_clk_peri:
 		peri_clk_teardown(bcm_clk->u.data, &bcm_clk->init_data);
 		break;
@@ -702,6 +813,11 @@ static int kona_clk_setup(struct kona_clk *bcm_clk)
 	struct clk_init_data *init_data = &bcm_clk->init_data;
 
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		ret = bus_clk_setup(bcm_clk->u.data, init_data);
+		if (ret)
+			return ret;
+		break;
 	case bcm_clk_peri:
 		ret = peri_clk_setup(bcm_clk->u.data, init_data);
 		if (ret)
diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 2641eaa4ca52..fbe0d902dc80 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -944,7 +944,7 @@ static int selector_write(struct ccu_data *ccu, struct bcm_clk_gate *gate,
 	return ret;
 }
 
-/* Clock operations */
+/* Peripheral clock operations */
 
 static int kona_peri_clk_enable(struct clk_hw *hw)
 {
@@ -1216,9 +1216,69 @@ static bool __peri_clk_init(struct kona_clk *bcm_clk)
 	return true;
 }
 
+/* Bus clock operations */
+
+static int kona_bus_clk_enable(struct clk_hw *hw)
+{
+	struct kona_clk *bcm_clk = to_kona_clk(hw);
+	struct bcm_clk_gate *gate = &bcm_clk->u.bus->gate;
+
+	return clk_gate(bcm_clk->ccu, bcm_clk->init_data.name, gate, true);
+}
+
+static void kona_bus_clk_disable(struct clk_hw *hw)
+{
+	struct kona_clk *bcm_clk = to_kona_clk(hw);
+	struct bcm_clk_gate *gate = &bcm_clk->u.bus->gate;
+
+	(void)clk_gate(bcm_clk->ccu, bcm_clk->init_data.name, gate, false);
+}
+
+static int kona_bus_clk_is_enabled(struct clk_hw *hw)
+{
+	struct kona_clk *bcm_clk = to_kona_clk(hw);
+	struct bcm_clk_gate *gate = &bcm_clk->u.bus->gate;
+
+	return is_clk_gate_enabled(bcm_clk->ccu, gate) ? 1 : 0;
+}
+
+const struct clk_ops kona_bus_clk_ops = {
+	.enable = kona_bus_clk_enable,
+	.disable = kona_bus_clk_disable,
+	.is_enabled = kona_bus_clk_is_enabled,
+};
+
+/* Put a bus clock into its initial state */
+static bool __bus_clk_init(struct kona_clk *bcm_clk)
+{
+	struct ccu_data *ccu = bcm_clk->ccu;
+	struct bus_clk_data *bus = bcm_clk->u.bus;
+	const char *name = bcm_clk->init_data.name;
+
+	BUG_ON(bcm_clk->type != bcm_clk_bus);
+
+	if (!policy_init(ccu, &bus->policy)) {
+		pr_err("%s: error initializing policy for %s\n",
+			__func__, name);
+		return false;
+	}
+	if (!gate_init(ccu, &bus->gate)) {
+		pr_err("%s: error initializing gate for %s\n", __func__, name);
+		return false;
+	}
+	if (!hyst_init(ccu, &bus->hyst)) {
+		pr_err("%s: error initializing hyst for %s\n", __func__, name);
+		return false;
+	}
+
+	return true;
+}
+
 static bool __kona_clk_init(struct kona_clk *bcm_clk)
 {
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		return __bus_clk_init(bcm_clk);
 	case bcm_clk_peri:
 		return __peri_clk_init(bcm_clk);
 	default:
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index 7064ce316981..a290f8870e24 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -390,6 +390,14 @@ struct peri_clk_data {
 	struct bcm_clk_sel sel;
 	const char *clocks[];	/* must be last; use CLOCKS() to declare */
 };
+
+struct bus_clk_data {
+	struct bcm_clk_policy policy;
+	struct bcm_clk_gate gate;
+	struct bcm_clk_hyst hyst;
+	const char *clocks[];	/* must be last; use CLOCKS() to declare */
+};
+
 #define CLOCKS(...)	{ __VA_ARGS__, NULL, }
 #define NO_CLOCKS	{ NULL, }	/* Must use of no parent clocks */
 
@@ -401,6 +409,7 @@ struct kona_clk {
 	union {
 		void *data;
 		struct peri_clk_data *peri;
+		struct bus_clk_data *bus;
 	} u;
 };
 #define to_kona_clk(_hw) \
@@ -488,6 +497,7 @@ struct ccu_data {
 /* Exported globals */
 
 extern const struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_bus_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.51.1

