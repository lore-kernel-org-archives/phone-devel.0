Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503344;
	b=1wksf+dRzNZSF+NMxNjhEeloe8odsqbBzzV4PHO7i32U5rK+cby4PwGA1kLUtvMpyB6h
	 8MF/IvoWUwmM/JT0Zn1H94cO2K99GzQUU80eE0z318rHRYsPtzcEhr509iUSE60wjOw+9
	 wHHdTtA8ZhpPSW+F4Vnoge69Gk2lLGcHyY1fHr0fktSJiLHrjh55oUm0ZalBjHso+m/eo
	 P19y0HqUH2WjKk9vD2XXIne9QoaiwPp9AH0ufZnR9dbf9U6H06Yd1d/R3oUlh1TPNsK+2
	 /bwGs1Rd5i1+Q9iuF02u1vHjeQ4GoqyngrV6mpCzJEmgvAjY1SdJ7arn/H03qlk244A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503344;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oj2TNmHu0aGvGVnFAhxBXVtL1PvBAFJMiuWObtt4eU8=;
	b=2KR3RTtiTUZbbX1NFJI7joGkBTsrtq0HvHUndTVtkjTKsJZw7CK4hmUodlEIBQ0asvEs
	 F+uyuNFjj3OuPHl3EYnbowO0LgD5/LNFtOrbvRuBItHUtAhx5psOf1l8aKiPLT8U1lQXm
	 Cwkj/TTHMbuUY+mREvr5LAklaSNRP5AElplJdKyzKsfaN3HPXRgQGd2Mca4GKZDnpxEyq
	 Kc6GCeqcoF7ahREN7sIBzv+jYSX4AsQbIYUW/ixxle/UUULD5d5UTZfeT5nINWeHokY09
	 t1cNrTE366D5Juidt9+vUx2alnIR3c0t3gGfZ4UjpzLmyu0pGPjWeuJCRHXDL3GcOBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=KNTpMS5P;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044EC606A323
	for <phone-devel@vger.kernel.org>; Thu, 12 Nov 2026 17:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=KNTpMS5P
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W6VeXoYsDeuooRLOPur5oKNEUPcbNXvMYUsUnI6yMhQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794503340; v=1; x=1795108140;
 b=KNTpMS5PiD58A1ons/DpdJZmpZOCajmxxKBM5F/RE+ZjoQuNDaELQmTkqYAwdvagMjqJPCOH
 VyVorLwW83zHYFDRVk9P6fnbphJ1ZPIVuU/7JmkCTfDGeBw/ma+fwnFbeaP6RRKc9ypS1qR3P2h
 ipGeKR709smjl2/rMw2zt6CDTkzPrBN71Ds1fLAaz78BUPpwF+3E83msDbhgNXUZh4jt2ri2HIj
 Sak3LhdsE0QAL95+jlxE2NM8uPvNuHnRUNWNPQa5+3MHZsX0n2eNmAk1Nr1zRLXLyh7V9Be9bEH
 Et+M8i7ydeO2Z0C2nSxkkowNxTqr+0WISXwIcDxn9lV2Q==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cc99491184bea011;
	Thu, 12 Nov 2026 17:09:00 +0000
X-Mizu-Trace-ID: cc99491184bea011
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Marc Lainez <marc.lainez@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add driver for Qualcomm QGauge (qcom_qg) fuel gauge
Date: Thu, 12 Nov 2026 14:07:26 -0300
Message-ID: <20261112170841.2189322-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi o/

This series adds a driver for the "qgauge" battery fuel gauge
present in Qualcomm PMICs like PMI632, PM6150, PM7250B, PM2250.
The PMI632 is used in SDM632, SM6115/SM4250, SM6125 based phones.

This series was tested on sm6115-motorola-{cebu,guamp}, whose basic
dts has been submitted as [1].

There have been two attempts at making this driver, the first one
"WIP! power: supply: Add rude driver for QGauge" as found in
various development forks [2] was rather infamous for wild capacity%
swings due to load variation :D

The second one was submitted to msm8953-mainline at [3] by
Marc Lainez, and it behaved much better thanks to the use of
power_supply_batinfo_ocv2cap.

This is a continuation of that work, carrying his From/S-o-b on
modified patches with explicit permission. I have added the
SDAM read via NVMEM API, fixed the batt_info leak and did some
general cleanup.

With the SMB5 work also going on right now, we'll finally have
full battery support on these awkward pre-battmgr generations!

[1]: https://lore.kernel.org/all/20261109221453.658316-1-val@packett.cool/
[2]: https://github.com/sm7150-mainline/linux/commit/76879bf7a71f4f8f66b9bcd7175069ca7bbf4274
[3]: https://github.com/msm8953-mainline/linux/pull/242

Thanks,
~val

---

Marc Lainez (2):
  dt-bindings: power: supply: add Qualcomm QGauge fuel gauge
  power: supply: add Qualcomm QGauge (qcom_qg) fuel gauge driver

Val Packett (3):
  iio: adc: qcom-spmi-adc5: Add ADC5_BAT_THERM_100K_PU
  arm64: dts: qcom: pmi632: Add missing bat_therm ADC channel
  arm64: dts: qcom: pmi632: Add battery fuel gauge node

 .../bindings/power/supply/qcom,qg.yaml        | 105 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/pmi632.dtsi          |  41 +
 drivers/iio/adc/qcom-spmi-adc5.c              |   2 +
 drivers/power/supply/Kconfig                  |  13 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/qcom_qg.c                | 807 ++++++++++++++++++
 7 files changed, 976 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,qg.yaml
 create mode 100644 drivers/power/supply/qcom_qg.c

-- 
2.56.0

