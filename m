Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01462F6565
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806942; cv=none; b=FJr0rp5l+GwRDhvst28Fkvn73DMmwFoJBxuIKoUvF3n6Fz+S9OkHFV6oCoeGVM4kdxHnCPFRRM1R/i48uLijRT9mXOCe+DIX0nJ7dNGzkYcqZnlg70ys4klmoZkeRfdW7sq1rqyCaFRzhKYIzyNEbKvo5p2yWD6BSW7SokmozDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806942; c=relaxed/simple;
	bh=arm7JnDlljRb1nmMKO4j6gwgpsWhDrf5OjYQKnPs3n0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H6Hau/+sAb654B+i0/gSvvwUTEHoPr73/hBhMw9VH6rV4svQ8Wreka2WaagfgfeybLofHiaKAp7wAw8fwPqQd8RkE6ry7BFGXPRa7FJDkl5jAXciFsuBmhYgihyMWN+ECyk4aXm5OVclRYkxrOTjS3TKVwIG/SZ2xX2Ww5RTngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0+OeJHCm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0+OeJHCm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so1235532266b.1
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806939; x=1773411739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJcxss4DXIYyerBkpQqbK77YeNLvuOHewQEof3j5PJg=;
        b=0+OeJHCmwDw27Jd8El7I45Ks2pJaPr41kBQloTWiVbZHqTZaL0Nhc0E3O4HI7Sht07
         MeNL+nJeqVPW4fiAW8ROeh7BI3ZB7nO35x/xEvO2/EN9Xkjy4F0MyZds/XNbOp9NY1To
         jEDL6sfgyS99PvfECvv0uoMAZxX8HtVL6BVUzqLlXLTfFQFrOsQiNsAaFXs7NXThlcp6
         Xc3Ww2QMgjr994mJOnLJ2WyJ/9K8ShLbkJ+y8pG110hu/o/jd3CxCoxewmYNpB19G5hM
         5Vt75kDuWJhYJRhpdlGt27Y2j3rJDeFXYMc4IcG90lqvcw5+FMwg5laJ5x14z5Go6j7u
         clNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806939; x=1773411739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJcxss4DXIYyerBkpQqbK77YeNLvuOHewQEof3j5PJg=;
        b=eIZTMWv6Iqku5y4UFaxq059XlbRv0BqaNFTRcb6X0zzkiAVA1KyKlf7RLI8jbcTE3f
         gJOAvar7k2UawYdK3ffmPcJ+GubX1AeaGvj9wE7j4wLPdbteb/OyJI+Gr7rM7zfDgooZ
         AXDLQyDXzYrJLol0nWEA0poZ6sZfJW6mIaN9VGtWp81t72HUrp1lcAwuzIMsaYuZNm25
         JR9HnoQexz5xaebwpJGjBuAgpNNSkg+wI4ZwdpR3Uuq8E4SVuaZwIs/RAP+WDS+/DOOk
         mbnkWQUgOAsWAjsAgtKRPGQSv74LYcNHuQY72totNvsLVt4YTUjc0IozV4VWSQgmDfn1
         iUFw==
X-Forwarded-Encrypted: i=1; AJvYcCVs5WmMWHeobCHMnTXfIsaPP4QHnbVQH8+bVF4CsRPqQ+yOl5gDBy3s9yyJvArNXK3oy2LVItfxJOc5Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRt+6FTyZ/C3tGQ/If646snjNo8UqiyxDaCttObr33sEtfrTnR
	prtQLgNwxxJSo1hWWd+6ad7YphaI5Xi2wRMT69/ufHcN8vGoRfVPpQK5y1WX4vZ0hHZhs46F7kE
	EgZPZ
X-Gm-Gg: ATEYQzwLgLHcIPkkYSMLOAvubJxUvBsCcGs9GZ2xcYTDTwNVFH3PNCKNvPSf9EyL8Sp
	cS8fEBXNOALfPikIoRMYuhr4gxKZuZwuo7zqMUuca9mHzaPz2SKdsaLDFs2o+aqaLb58ZFQc1fc
	IZ6fp4iScyeDAAe8F6aVNhocOFol0k79JdbwWyw1UvzFbtkBUey9fC6VN1GSVFjWRyVknsUmCwW
	/JgsKhfdM+Whtxw5jTuGjVM2AXZAyBkJzKJmGXJZ+f4TOZFemSc6Wg68AI8/GHW6if1uMD1CH+q
	sbokgw6QevqEW3qSDB4Hs34BPac3COWWj3chGLOswqABBtZOTIpkZfOhiKeBLcF9AudcvyEY0zS
	6oa9lmXMBAsg5kZ9o2EYDwR1jp2kPG9h9wUsKfomxH73YxZ+Z+tohtnyVDA2CrApKq/PqWwwT/y
	p3/56PfRNBSwclBS+/gZFqR0mCQ2DwyTWfHkGf+AAzva2CO3ST5z970Fj62om6krgpjNGXf9yH9
	anz
X-Received: by 2002:a17:907:72d3:b0:b94:2025:313 with SMTP id a640c23a62f3a-b942dfb4897mr136403966b.32.1772806938645;
        Fri, 06 Mar 2026 06:22:18 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:18 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add support for Milos LPASS LPI pinctrl
Date: Fri, 06 Mar 2026 15:22:14 +0100
Message-Id: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBBFf6WZtZO0FQH5FcOirQNOwqO2lZAQ/
 t1GXBiX5yb3nA0iBaYIjdgg0MKR5ymDOglwDzP1hHzPDFrqUp5liSMPc0TPk0thwMEzKnmtLNX
 Xi+kc5J8P1PH6cd7agwM9X1mdjhGsiYRuHkdOjZhoTfjVF/DbbcRftTMxBe+w9wGlLsrCKm1rX
 TWLgnbf3yylH+zNAAAA
X-Change-ID: 20260306-milos-pinctrl-lpi-1097be895afc
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=1441;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=arm7JnDlljRb1nmMKO4j6gwgpsWhDrf5OjYQKnPs3n0=;
 b=B/rj599DN5JQ9pcRwlmOIBEqlKVgqx5oIF/zZahXcU3xXFaHnbRDiKAFtnRRqbdeLP5d8+P0O
 DLuweHEoxxjCYYOVbqMZCAyRKtcar4n+AFQmU/AW6Y5bV66LaE+p9Zw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings, driver, arm64 defconfig and dts bits to support the
LPASS LPI pinctrl on the Qualcomm Milos SoC.

The devicetree changes require the addition of GPR in milos.dtsi (as
specified in the b4 deps), the pinctrl changes have no dependency.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: pinctrl: qcom: Add Milos LPI pinctrl
      pinctrl: qcom: Add Milos LPASS LPI TLMM
      arm64: defconfig: Enable Milos LPASS LPI pinctrl driver
      arm64: dts: qcom: milos: Add LPASS LPI pinctrl node

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      | 109 +++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 103 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |  10 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     | 217 +++++++++++++++++++++
 6 files changed, 441 insertions(+)
---
base-commit: 755bfcf32666f86ca2a9a2ea2c9dc7eca4c330a1
change-id: 20260306-milos-pinctrl-lpi-1097be895afc
prerequisite-change-id: 20260306-milos-fastrpc-gpr-02464b12b827:v1
prerequisite-patch-id: de7e8d4b18a0684e3462fed3f2c82e4bfb7f726b
prerequisite-patch-id: 08e5420023b3400e25c200e4cb39788b53601291
prerequisite-patch-id: 1430b5aa008efe8ed72057da3adc4892d8043918

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

