Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA037C91E
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317701; cv=none; b=kTiQWd/dayZ48Togra388MyIL1jMX8lZfN3HfGXjlVOa/pnBz84BbR3fI2F7l4sgfXZHsLDp3i9Sr0ubp+0OeZd/WqYPjA0BDE0nDu+Swuz2eF+9j3YJfIOoyzoouqkwJQq96CzKremmvFwcmC0a5mRolzISNF22R8wKeqHNyMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317701; c=relaxed/simple;
	bh=C6pslvwk58QZS/2zykKJiaeBxMWH9ps/RxZto+oATu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThcftQcgrx53aZDLf/KxfeflweQbj+pIAprwKRFt8d1Il7D/oYxkxDHj4kGQCoDOXTj3mnUWMjvlm9n/rcJl1XhnVGjU8xvK+4KmVXbHl2K2pzkXV49mQ2n6TMJzV8u8HvcqFd9sNJLr+GDqRjaogRaA425j45RdeAzWrdDiGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfaYsNmW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfaYsNmW"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ca01dc7d40so75851285a.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317699; x=1774922499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=SfaYsNmW0IwfbMzmI4JMhZWzwpvHC8uxEFvsEqOxz/1gOk8+SKiwqrss13qrEnFwfk
         1BKMWDha1de8cgfg8x2L56kwXE/rrzHB05sKXDX8rrb5dIZiQmEYvnpEmin6ktFCF4hS
         ipMsGVaJi67SfAtr+i0N0BXUW5+AB4DBJnKUZtBi7utgbsuYV9U6pvEJzsRleoSKBBVT
         7asajKyI040Y5PMm8XLu6lv9bRAtvJFRPCY+9HSIj1USXl7ZVw9Z9P/PW78Y0Tsh20DU
         fr12HZ2nx8BEtwxoiFIM9FT/SgbVPapLlz1GC00hDBq7XblbqxIjZ117dkWnscqJacuW
         GlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317699; x=1774922499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=ijb9rTse3jxyTwmcGhyWs57bFZILaTqNB5OYl6HO0Xa8PX1lYgY/c0Zf4RcdOF3N7+
         03VN8w+IN0eZIYez7yI76GiERZmIce6NUZm/p8AGgrSe9nWfwysg7H6riU13ZSAKHfwq
         TgGYmpdxWVyCTC5ESU/dKlhv0GtcDBBZ1KqHKxAgY3XeeA3DIyHTGkzJ1EqydBXD8ipw
         VvsFtTUVOn+xID0yX0ld4HJRjagR89ibpxoRCqLaMpupMcQxGlvGSv/K0UYmvhJf9DLU
         GClb8nZPwJdAtrJdsrP/YTQoLEiqnaduMPrdvyEfcbA+JviE3Q9O5n7cH3W8jwp5IREi
         7j/w==
X-Forwarded-Encrypted: i=1; AJvYcCVaPXIG3tNw3YfeJZ6e0zgoL5FISXzY9UEyDBokXm7Sd66pSXIxnoCIZcxCjmnVMc/AxpmnZuTr+7blFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydyh5jLzrUqhO9GzZ3OkvCQ9RL5tc4S2j23qE01A9OLbx2dNGm
	x195xP6TBn0CDwlXn1V9oCAX2z50iWwKlqGFVXXv0SBuDaL/XgxHwKzl
X-Gm-Gg: ATEYQzwd9naCbmYnbOhYCzgHRUEZDEnS6c1rvs5Eee+S58RAIly8XsUXXeR6/6Nt4Au
	AIkYabagk12KvkVWHlq4RS2un+2UZ17LUYlRHtyZGBzlea6xk8Vn+uO//vTJJFDr7pOOnknx4a1
	l9FYb0aNfPU/Sn661fkY5sMDoCLTv52EzGTeY1BpiG2kIE2n988xQuObf0wtepK6e44XnV0sUzM
	7+BakTrOInbNBnfN4XsQQTVWRaLFomEqJSDwp6Kq/W8fqo9gwdkWH97pi2zXoBSPE1d/FG83b15
	EtF7DAHrVjlhzoXCrxEiR4OYH3f9s4xtYfAUh0VUfOXR6NzZUQAgNSFM8v3KrA/sGtPO8zzy6Ag
	X7/cWw9yBJVuA4KDBJWdwmyeNBUIbk0aLj3mQzaO3lc28Ev1RPz6f3BjqX4msXqRCBonuism8F6
	usV+llevMkU8+19qXX7ypjPiMNOp/9Wvfn0E7cexXLPBS6TtmDqk97+ApIqrqOl4SRC0elPA4Mj
	hT+4sDSFXR6KcY=
X-Received: by 2002:a05:620a:44d0:b0:8cf:de1c:edea with SMTP id af79cd13be357-8cfde1cfe37mr1423972085a.13.1774317698665;
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff3119121sm140450585a.16.2026.03.23.19.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 4/7] media: i2c: imx355: Restrict data lanes to 4
Date: Mon, 23 Mar 2026 22:01:29 -0400
Message-ID: <20260324020132.8683-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..27a5c212a527 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -66,6 +66,9 @@
 #define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
+/* number of data lanes */
+#define IMX355_DATA_LANES		4
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -1705,6 +1708,9 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0

