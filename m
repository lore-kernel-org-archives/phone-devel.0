Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690932C21C4
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317723; cv=none; b=YAC1uBGkj3WT8wD1s5oMkdM1Tf8POotnyprMDbhcgcPZn3lA7ERYpyiVcmzEDBMHp5+cSsJB4uVIUCa7z9ROnSCMB4zRbXyjrYEdt5PZVlAWUTNUTivdNtwQhIKiuX9ChcT5eqoI/OxQh1y9ZeQqpw/tERfVJuYTFN16LxLjypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317723; c=relaxed/simple;
	bh=qu8bAAJfjLJVtPJ0M7mvCqS6W5WISRGIXt9zkmXzxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0o1m8yPSTEPSqwhEspF0mlXjtingX3WMpNHOGS26w90jchnn+tfASrDHDkJTTEr5SGjFRyqZ1sB+lwfvJS/Z+jeth0DqJb5FsY001ikuG8CCYiHhkSu64c7Sm+pR5h8WtFisziqUsMWkvwZrZArXClYV4N/POKrhogxT6Td1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IASRu3g1; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IASRu3g1"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd8c6e365eso323529685a.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317721; x=1774922521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=IASRu3g1z9MjeM9r2pzebIzPqz7ulMp+r8KhkmIMbMji3jmqer7+F5jcuo1VLubN+r
         zeNyPJxWyEc+GZHQrn5ITV9pm5sRNsJzr/UoJAdU1jSyYndEFAzLAI+sJTFJvscBxMJa
         ebyX3daaZsXhLRRALIH9cGEThaF3N/m0CTPbngsFVpwZpPpdXAWURdU4aINa3CNQ5qJf
         FDsEcTnwK1mdPKZWAML/dJfV7gejEQcicZ9s8w5x/k33vuxxAefRkDkr8308bjBNqK6L
         wwuKPJjRk6cos7z9/yNhjfXOZY1X583YHJejP6oGaZaSAWK5DH2dLJagmMOBp3gdI9+l
         p2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317721; x=1774922521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=lW7F11dX7itl3ygrHisk/ioSXY4BGLCpuSvePquC3vhB6Yt4CRH0ZZC8kGiyPFCVn6
         hy5iuL6+A87J7YFO+cKnEyAV6CWSNpEQt4ZUqVvvwG1yNgqp7wubSf4xWHDXjxOtfCoU
         XVABi3fHcpEzfJ6pXcHwp7z/kokPa7sBApctbmc1neNWE5ZtTDmwsA809bKXKIQlet4B
         RcuuQFD49hFVX0TArTf2L3lYUHmsMAXa1imzLC83jTTLDvJ7fa3ZYJ+iLBMWCFB1tqTi
         yw2Hxm/X0U61JqjCSZbMllpu4jqzoqmR9i8dibg4vrrRW49R5/xgZNLuSXxWJC+QeIdb
         1X0A==
X-Forwarded-Encrypted: i=1; AJvYcCUF29KMRjcOE89X7UMIXpCm1JNkTi8a2LGwS62Oofh7py1uY16d+lDTkmCfERWY/UOS3WCJgneih+GX9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsdgOGBppjV5f7vofXvS/WHd08TZHqFQlbKrACAQpHkrWzsmD
	4CMRO8hsJoVm7KkLBn89wsi5L4myQASdNY2hISVnOdp6WooYB6v5PlWN
X-Gm-Gg: ATEYQzyKNn67M+WR9KXfeJZF3ET03wlfg1VZs/YWLuksi/lHdXYcIxqYzySkZcivtbC
	RVk4R/XDyaRlDX7lHD1xtLHOhTUu+N+ArMrobvi35x/Cn/GPj/XBoz1C0aXWnpWAuS87YBE9Dun
	r1NVl120+W+Q0VCcpDFhB9fU5x9UpGPylPWzsFFvUezCpxwn5qMTAjb5YVCEITQUauydzZ7+EXs
	n0ErfIqVYa9O5SiSUNQlULgLxLf/FfVVD6qWKqjmDya3sU1B+nSMziiNKMQ1SNfxHyKRvaHTFb6
	UX9NHSTZCKctFD12os+AbTo3qCufYVpwykJUDEGM4KxKVd2vg+oFEGYAl3XuPe3QKGqioXd18ri
	apZRFhT1ql44R+6revS8HQ4Xu8+bUMWwwpWBzAyqvkl+T2Y7gB00utXoqGd2ja286YqTQtQQI3x
	Z2xYJoZvwrgs6MZ2TboT9wvh1gFDqwQz5pV8CSqBIJiUhEZ75azCsceyyxYrtw7H6Ott3uOUScI
	Y5MJG1aZxR5eNU=
X-Received: by 2002:a05:622a:1baa:b0:50b:460b:650e with SMTP id d75a77b69052e-50b460b6d72mr180422571cf.49.1774317721246;
        Mon, 23 Mar 2026 19:02:01 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e5b98bsm97538511cf.20.2026.03.23.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:59 -0700 (PDT)
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
Subject: [PATCH v11 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon, 23 Mar 2026 22:01:31 -0400
Message-ID: <20260324020132.8683-7-mailingradian@gmail.com>
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

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index fbd16b1f3455..f115bc6e64f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.53.0

