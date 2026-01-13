Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ECC3933FA
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313648; cv=none; b=b4MmdSprIMEybDl5Ot0sqfeHD+TkF2EUd//boeWyDF0xavQ6QRnE0U4dh15VEp6+Y80sPb09O+Gdm0Ls5uRPt3ELtN7R7EbTXOAgwGc/4N7XfyQws7/SvMQRpg+4UPVc+jeu7vxPHlGRIFn4d98c5Fq05GS92irOnnNRET3E6zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313648; c=relaxed/simple;
	bh=Yh/skuOQuC/zZ/fQfc54UBUifN3ebScHgpu0xUQPYSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOjAbzBMHFZorxKTI88irT69VnB1YWOAGdo62OL3dW7p8+hgHCNCTpJHPByqvgDL0HbCsZB4a+SXuzTJsm03dVJaAnaiAMgNlrWFDkpPtkZwx24+ugcPHHKOwqNy2Wd+ZOYEceYIMc+iEyuVevaahxEI7sd8ith6gy5J9XrJOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkK2yDQ0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkK2yDQ0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bde0f62464cso3141215a12.2
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768313643; x=1768918443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh/skuOQuC/zZ/fQfc54UBUifN3ebScHgpu0xUQPYSk=;
        b=FkK2yDQ0gdrvpsMBaScW+qvQ/ok3On1tPM9wAIf9HZvAfV+wz8Cg0/AeF0+qhQ3zDj
         J8pLhylFsLI76gMWMb/tTQ2Gp4WGPQ/Rhvie5wfnhWQ0GF+XgEFs6O80iSSOpyGdEmbh
         ECrhFW/bDJrpJzYCDk7Vhde2GE6Dl7qxnIndtsGfGfgR/7ryxFIJSMSAmqyt5FEEAjDD
         Xbkesv9BQ1mPoHIc4OGx5GyoIrxxWc1cWXJPcCwlw3bYE4mq/XRMBVLITr5e+DW4mlhz
         RZxeNxUmaA+bgbGVXI4gTWAApRStrrLRoTJi+GIAt36sC+yWxiJD7ie7FMg8Ffj1/Rry
         NRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313643; x=1768918443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yh/skuOQuC/zZ/fQfc54UBUifN3ebScHgpu0xUQPYSk=;
        b=or9BXkj1omMht3EvEu5W9/NucJs/skRAsutZ9nrz8G2CpsMi5Hb7CVHmWMYTL8A8h9
         seVNHnB/JuuQkdjRra5vqfkvTm9sRg3fwLPIcOdpI47Wm30mkVoX0KxwZkf1eyx97fIP
         vJcKFW2XwaOlrot4c9jo+Jk4e0sXlCagTwcX4vYPBERXMgDvpm+M9JMU8NAKYm9WqiiP
         rKox2O3T/qmUaA63e1Pav0LKY4xSF3eXkkfoNKSV226CyV9cXqwZEc/TkOvDP4MPOI37
         KXCu07qQY2qIP+OqiGVKB+OKP8sJN6er2JNdIaOg0cVft0KwW7ay9bf7Nd2VzaYuPl+y
         ZCBw==
X-Forwarded-Encrypted: i=1; AJvYcCWN8pg0dkhph+Di89KigLWycHKyTsU1sqR4d+tc9XJPju9huQsriscL24IIUPoLKaIfk14D2vyFNdfIBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vsqbQwkqSQ+OpAXFulowp8dIb/5dQE32GHbNYqKPLVlbCBWn
	SB9WOutDCNQKLD1wsYHFL0G2S1NawOoiOmagDpCsxEAlBm0xC/J2/r7Y
X-Gm-Gg: AY/fxX7xv2PXswN78yTpAfsuR/BEPv7+6L8Ki+REyAHVQjCrbCi4XykiM1XkS5//mzX
	vJUGSqIgiKauzK1hvpziKlVjgRx0PaSaxJ8iJ07GEybzTxRugQuj2J4/Y+Ek12H49CwVvRf2LrR
	bUPJjMNx8EHIUCrHk2KOIwtc/D+wNU9YvKXFAFdlRfD7mgYVKEeGxJosnS8FC6yugmAX1q9yCfd
	D5oFv0Ct9NUROONV943B83rw57MTHgeZHPXnRVMUeF4CGv5ypnQpbuqtJLijVCbbYvgAluY6gGa
	UzehZpye1l4ELvF6/GJeimEmF47z+gqo1t9VfFtJGjURmnDeNa2gJetc2l+PXk0/kkio6adU7P9
	G8hKlT7N1crobjI4tvQEciPdZ40OThogZ+rRSkAc41z0DXemli1zw1K2cLXF6NXdDwOEPJM5rcC
	QyqYtt6ch7eA==
X-Google-Smtp-Source: AGHT+IG7buq9CzX9ZRTrAw60UgkpwZAGNd7i/rZuf8pczHAcg2auSyZzQR/xxashE4pdHuR2UKZuqQ==
X-Received: by 2002:a17:902:da8d:b0:2a2:f2a5:4136 with SMTP id d9443c01a7336-2a3ee45b2f6mr207785705ad.22.1768313642789;
        Tue, 13 Jan 2026 06:14:02 -0800 (PST)
Received: from ArchLinux ([45.113.100.103])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e3cd495dsm205884225ad.96.2026.01.13.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:14:02 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	barnabas.czeman@mainlining.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabriel Gonzales <semfault@disroot.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
Date: Tue, 13 Jan 2026 14:13:36 +0000
Message-ID: <20260113141342.11057-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <e4f9cdc4-1b3a-44b0-83f1-315c934985ba@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026 10:45:02 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> I was referring to the NFC eSE (embedded Secure Element) which usually
> has a separate connection to the SoC

Yes, gpio 0-4 are connected to NFC eSE and gpio 30-34 are for
fingerprint scanner. Here is the list of reserved gpio and their
functions according to the device's schematic.

0 - ESE_SPI_MISO
1 - ESE_SPI_MOSI
2 - ESE_SPI_SCLK
3 - ESE_SPI_CS_N

30 - FP_SPI_MISO
31 - FP_SPI_MOSI
32 - FP_SPI_SCLK
33 - FP_SPI_CS_N

Though Redmi Note 8 does not have NFC, kernel crashes if 0-4 gpios
are not reserved.

Tested-by: Biswapriyo Nath <nathbappai@gmail.com>

Thanks.
