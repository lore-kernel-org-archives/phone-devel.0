Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485384;
	b=2kBrPIbxclFfKPQW2MwzPtpVE4+5uPizVfxIg5AKdZeGwhxP5zgtZb6REmqSvpnyqHQE
	 rQSBlcB7Grggn8md+WE3Z5nI6XtM6/gmoV8jiObpIxAYBjcYsRyJasiZsJAnTOa+HZpBc
	 x8FQUb0KzX2sgHCB99CYukK6tMfxqxSXXFHb8TmphPuny+9zG4lcmpfoW88yX5oWDCmLc
	 TllJrP54iGSqYWOloxHCf0Fz+AOdS9aApDtqHzD+P1JHyYmqI+Mf8ayBMjklRJSGCL/8X
	 TVyutgtvJ3iLgNoufpJyZI8Z/Bfz9vpLm8Bcil6/IdcOWYY0rcAF1kWe83VUWJjUfXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
	b=NH0kfSMBGwuXCxouO8Pm00TSlwcj1P/UExqgJS9Y5bhC6QgmmBHgPT1vfNx7iThrA6cY
	 xzorp8i5CWCBIMuW+6DsMVhn+4Iz14xI4eEzm1DAm6HLXlaveKjLchh3tc6+s6mlAanAC
	 i8ZWtQWWpoPbRXAFk5IBYL27nxFETMDx2uvOs5tzF8a9elNjy8rCy0sqRXpdB70yPPGmz
	 KoaJjoYR3AyHJGcyiT5Z/mPgc/Hp28k48PXjknPdtiBhqbDxTyDhkYc89mgLyxfjhX4I+
	 D1WAP3x4BhCMFFPXHfYJkkhSH4xMkDnIeUCt/X3Tw2lLxSnSccm1Tr4hYPy/iXMsAxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4DfO8nm;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFC606A31E
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FFC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4DfO8nm
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-949664ee41cso420515785a.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 17:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485383; x=1796090183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
        b=z4DfO8nmNbrEgFqhLcRF8JcVLCkC/ktyGqWEafsu/BnXYKGWDpkQKyjV6z/HDjK1Kq
         abYz7L0vbof+4kPv/6Qx1Y/TBUKzBvE4tImHN8gB7d9oeEioRLqsL3cyRz8NEGw9IMjf
         RU9ebb7eB7QjWkzxjz2vsQrykKsN380f4aP2M3MWdCLrbfqdUQRZkwQ07G7V9SwlRwLq
         nPzQGI1GzGLj6TJUXX763xDdMuZGfiFkJxLujZZArNEEMpxtMg2+wWr3/IqJv7q7DS3N
         OJ1rzC/wEMX0qDKS3cNd+rKKpKTcPkXvM8d8NOfEe+QUY3s/27FEwB36Whcw2FfqJ9qH
         +aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485383; x=1796090183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
        b=igXVbrVrTGM0MPXUE90ijc5iq6cHh/GOP6QS6eKJE8UUsvMrwpmGrPLNGG7v5cUT3f
         6gYCsR4kJrZAqHFSCWrEaxB2BzVywNblRvLKBSJe1H+qjN2e8yl+Ny7Z9Wj9i+/Gl0oX
         FED76uzxT5qxLwTPyfnEoQDXogibcjIB/PnA3aTL0fNmWY9PvnkOXFYNcpVDn9NFlB9d
         zwffiWZgghTOu+h5J+8nSzi9S3O+C4PF4uzuo5TqEt8q41ImpY1gWX7hNAOB7aDicRs8
         oVeCflpvdQCqt1osX3TVLyCth6TOalHxICayuz4RsxNuHBT/2o2ITai0TOn8QtvvCI75
         tMAg==
X-Gm-Message-State: APuU4Z9uYcFHkp3FTLCzSW6oda6kglCCJQz8aL55WBn6QVjXakU0uPqy
	kafG/5F6dkjLJVlsRiIesajK20gF/5GyzWNYprKMsUwgKrgc+N6SA7Iy5ZB1sw==
X-Gm-Gg: AZFdTZe/wdRB7Oi7gc3bDkxd/CdrGfUwUx9V6/s04py2qcCWWxLjAaWzBPc4zQ8wEcQ
	g+nUO3tsmmomhcoLOiLYWxWq/iZwX0eYWnf++9vbzXQiP+fXNWwk3rzZK93doEHx+bX1dv0ZAtC
	syTHPLdbiEz6+upJ+l2nY+XuYIg5vGvm/gqz0vTfRotqPPISa3tqhSZConL4S8JQKPNt7roaa84
	4q1eskPfheejoZCnBX9nSz3kVMKPWyXiTSOemC0b6lgAGlLkVl3BaqYCY48xh8HnX12QqcGYwKo
	IfliSp8bGMIVU7YNFt8ujigTD3SFLBIqXpzDB+RJIxmVMLvdHole/zM7aarocy7hA89OeSvEbTB
	9qgaJK8izoD75GoPjrkJBMbAEw3v8Ibijrsa2mtX+RM7C7wxHwoSqM5dFi1C6MASQaBnKOwSGhZ
	N2JP5nO9TqlR7Sh0nEt9VE0qG6E7orTwnjZHSa+uhTjMGdW5P9F2pqCH8tTcwsS1Na62figq0vx
	DaKVppZ2c+Ij8WdF083+3RFIB/YJqwlfZqz8kDHPDtJPvw7SziZmMHAbDYW5DgYWXeg9zM9+k3P
	9FlLme8cIzge+lPvIEJuZWOANq+i
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr2479954885a.29.1795485383133;
        Mon, 23 Nov 2026 17:56:23 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm941507985a.14.2026.11.23.17.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:22 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/5] ADSP for SDM670 and sound on Google Pixel 3a
Date: Mon, 23 Nov 2026 20:56:06 -0500
Message-ID: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v3 (https://lore.kernel.org/r/20261107022453.159341-1-mailingradian@gmail.com):
- remove sound-name-prefix (3-5/5)
- add newline before status (3/5)
- add review tags (3/5)
- drop applied patches (previously 1-4/9)

Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
- stop using fallback compatible and add lcx power domain (3-5/9)
- move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
  (5/9, 9/9)
- reformat q6dsp dts (5/9)
- set flags for codec interrupts (7/9)
- move "qcom,..." properties to board dtsi (7/9, 9/9)
- add review tags (6/9)

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (5):
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  37 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 139 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 198 ++++++++++++++++++
 3 files changed, 374 insertions(+)

-- 
2.56.1

