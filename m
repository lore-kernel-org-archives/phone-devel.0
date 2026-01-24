Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DD238C15
	for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274617; cv=none; b=Vq+GWeYa0GBGahPHJ8ZHj7X7M+a92drmqIBtkhfF6as39JypHRqC+JMVDUB/F4gKSnvcMhAg0ujZUR2ejGXOpDEwLX8vr8XSgiIdLdXUOVB2CPthsm8Ktrt2yB7H599YorE0qUwMiYY61snRA5pLyHGlYHHe/P2vWa81UE8MKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274617; c=relaxed/simple;
	bh=E/+Vw9F7Uvr2yppAoFwMqE4mYWZlreB3QzMhNngRC0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0JM7ggOUyVL25HRGYQ0XtRcS+PSC+g+Bsu78dJlExiSgBYOE24ldRI+UKnn+9TiPxWNVjz+K7QDwOS3SK0cewOcsh0zNax5yKTlyow7L5cO5RgRys/YvIsrRNiXZGurxRSqqyRpt9LmQVzJa8xgeuRFl08zK7MXk05h/lkwloo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sxsp/8wg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxsp/8wg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so408776366b.2
        for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274612; x=1769879412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkAYbw1P//ms4g5sKeB++qe37tbbTNP4LnBeMSB+xS8=;
        b=Sxsp/8wgmDnszo64Ly+2S4A0wtr3EM4Lq6eIJzjB3U7nzAUgCRsqhlcV4FFquxJTUH
         QQ4wxcs6o/A+k5kaVVjMFIpf4CvogBpNNIBPpqxiWm1zoDNNrBP17tK/jA9kgm92eUFG
         NQ7bF78KKIOGIFo3PSQo6M6iMJJBry4zhIf8q34Dkol3twDIhKV65F8oxq79wlSxzxaM
         gRv4Mvi03cOQGLnddI9u8UuFbaYfdff2acT16n0E63ZAtSvHU74B9/Amh+oVXEjo1IDo
         cae5k2cAEKT+6sUOgwuamCFKTrly8SWwHhT5+WDvn0K1z09h8wmecXxDUGJGU01WdvSQ
         I2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274612; x=1769879412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkAYbw1P//ms4g5sKeB++qe37tbbTNP4LnBeMSB+xS8=;
        b=ruGpmhyWJ+7s5ZB1QGUqEDlDYC++cJZ0z7HX86JiIldmxWzrYOLGI03pyALUWDi/Eo
         dU36zAjHLGh0cpNJWeUZc2tLFg8jHgjfrcnC0KIXI/LQ0wYzUIYa4yWnTVq0uURDg1Bl
         vzEM/7rqKe17ymIYlzMuy+QNWpRMxdbLkF2bK0xAQTI6Bxfv72OeZ2ftCPIa6KY+6n2N
         54gt+1ebx30hsmbdzaqbJzYWkCXePWgSFIkay2b253ifJRBX6FeyCBcVknZzzFMFEOMX
         moonc8Yxqc2KS9Boh1e3COeGOT9qBxAEqOL0jpG0P7C9Gtt/k5Qq/om3okwVge+bAlrD
         xQDA==
X-Forwarded-Encrypted: i=1; AJvYcCXXzhUeO/1WwneLmzubY6jxUjcZ9OAGCtrZqhS28qleOFDVTfWQb8CnH61NFiGd5mEpK/ihgQ+MetniXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrZZ06aQW6x4Z393+CnTqkrIAO9w2yD3FpU3rMPIi8XwasuzB
	//7qhzhviGUWKqZiOpH+gpb91x2Oq8QnLp+yiGdBn6oNRzr11ZgAE5N+
X-Gm-Gg: AZuq6aKYN7nuXTRRxc0tKKVHPf1wS3I5qJ6g6M2xHZeQdbhiL0faEyQ7MrOyVmltG2g
	G5r4NjGvnGSDruhIcE/ermUF78SG8NRv/mcbm87qu6DcgBfqTLfdv18FSh616yL/g4/NhIkB6uY
	kUyhdD42eCfQoblvGgbMYXFkaJWZWf+ALus+X8yCMc/CHYplx0l9jFG7J85OUjbv6AkrvN1ZEy6
	L4Bqs+2THRKXoCpWi1XZH+/d4eXuDZrzk+acwjlzrki5bNSjVUPZEySHgykzRBg98xMsttTfK7s
	jaA/D1yv2M5uzV+CEU7X5xae1G2zXefF1VayLAhJDbDkRLKp3jPWvMt/6p33gXNldlr+r8PLujb
	5JghL3O7furA/M5IJ4fwmLQdRz6orNzwGuEquauZ0LUClbgpZveBwhudciSraXblmM64gNA8fah
	SXFwcwT1Z7b6kHVAJZePqANmlP4ViJWARDyWkX8GqllvbTcHFBkfVaiJkzHof+s96WURPpRMS5D
	fr3DIo24m2WF54VBOc2FvpHMLwfP4/+Xn+Mo4CBZizmaw==
X-Received: by 2002:a17:906:209c:b0:b88:5bd7:63b3 with SMTP id a640c23a62f3a-b885bd77b43mr296217266b.19.1769274612000;
        Sat, 24 Jan 2026 09:10:12 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:11 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:05 +0100
Subject: [PATCH RESEND v7 5/7] clk: bcm: kona: Add support for bus clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-5-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
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
 bh=E/+Vw9F7Uvr2yppAoFwMqE4mYWZlreB3QzMhNngRC0E=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzriqsluyjagdys9/FEx2+XV/RmsOvTNJOBx
 a0M/1hJ4w+JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aAe9D/wPQ3RRLhfE0AMGkG/Q+xtBT0eNMV7a2s2/dGSFdp3AynYxOohBcvZayoIEKD2vLFDNDvk
 ts4epLTk6vkPJgWFvjmRrKR7CHqWkHdDkUT+O0gy70reKq9e/OXKo5Pfj3jvAwSHF8TgV93zoZh
 r6V811uzfwFmqGGiBSAxQtbp+d7/V6zjR51NYFx53bYFO8PIqD5ywywST6ag/S8xjfnhQcMDpkK
 evq5wXmWp1PG1tHkPvSl+brmv9kJzUNvZCiYycBOhP3umE5RiVfBhrjaN3G1721Ag74LDUuomFV
 f661qTHUhIfSc/2GlYms6stmV4waE+kgzdA/1aVhmDlgeL6PBeUfShm/SsdTY20QXfX2FLDNTTR
 F89JcoTEvS75HJeIcEOaDh18fjOsX0hJXTM862+Nu65XgkavAV6+88EmX91Oj7YBRun0bVIro35
 59gKpExrjkhr9IVlrQLrHrMYJ3isS3VpcSkiQOo0CtudGuGvPH1aj7OWE6DeJWrtAE1NQ5/j+1i
 LuBpY6U0fXnl36t/wgl4hsW+ZReg7RsCM8uzzn81l80NAa9kIyba0kvOg7G6Y3Uiz0oPHF1SmQF
 mxYyvSlP+gk2eNmoD3jy+TLj3Z6Z+jlw26xfO3szI9baZJyduUTxGVZCDbvz0D6oeCPR212A/0+
 wHyYtlZ1gabwg+A==
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
2.52.0

