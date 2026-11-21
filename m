Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281798;
	b=pak9aTCxnIQBYkxSKYwrCiuyQLT6jHNFSK2QimO+rJy7G4vdYknaIgipn3ox80RKscNx
	 egbA38oFmj0UDKWnSoR3Tbhcb96MppmCVMGXxjn/cd9L7GVoKKaNBwez0NVADM9RI1DEB
	 T2TnVhv3BrFaruQ5iuWaPxIcuuiumB0+Pqtx37OlpZkYogw8PHY+7ZtkezPldxVtyknDv
	 DbJNbmCgAO2P7X9yj6JxD8YoWeNkFy4Aa0qi2kNRe67H8LYiecrCl85nmbAHKa8yeESQa
	 Zo1+4xs0377Gg/UEUbremBZ9ZD66lg9g/3+d4Y5bKOy5YMn6bm7anX9Bqu6Ctv5V0XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
	b=uA/0WpDyJJvO45BFqs8ua2ECUJ9dXfHEP8POaP5RRlOS+icFcySZkOyrWPwnNzbI97mz
	 ooB6Bk3OH2/2USVTinIyALziMfAUkSRxFi4z3JbrUNx5M7JyNfN/JDf1emuqJD2YwrAmM
	 Co+us0OAdPcpr8MKpatpAkwqO4zhTn2S1EWhFGfH8BmYyDCRmhVeWLGsyZ5UHYmv+yCp1
	 6ZttTHLyxrgEZMYHFlK5xbCtAK0qjdiID06eEWsSUn0r86PWpDdNJjzk964GHolHL/uY7
	 hQLxtmmGaNLROwy8iTSJ2rdE8sNTEfk7d9YaMc3sLLIDzkydrTckrlSyDaOw7ALeWEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0156E606A32C
	for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0156E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4211902eec.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281797; x=1795886597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=lRO3qt6jwuQ3jetshv02wRrSxpRYrXbQXzoajLn1J3Yq4k7u8wVbh9XMq1yJERTZ1l
         qiCgHYN+rxXKDOy1LND+/FqW4GmTY38yOVM5JL8YETrPyQQMX5wG3Ul/MSRJ+eDEdOhw
         mH800/ng44G2LwJlv36HaBwMHsHe6lC0axjitMuLP9OHU3NHlOMkrg4lsG8vq1RfCaud
         ZtMI1aJf0mWvPmS6D+S1FX4VZI3tHzWY4JB8U87wGleiLvZkrbb5ukzrEvj9WUKaA5Ba
         +BIb3OfAn99n65WsQbbn4CcVIIhF8IWQzGPrUUykZwRfFn1oKNBzyd1rt16hBSfHAa4/
         uSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281797; x=1795886597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=NJZ+sxdwi+WxFAHz3X5vc+43j1h8VwETz5jQDeLgYRbuLDUeyBHciCA4yla+6wy75x
         vvYn/rLZIIg+97n2Cw5IAC6Bp2LLwF+pLRL5JZM50a8xno0LJQF/DEzfFqO8sh6RXI1Y
         3cneEORcwluG34PXZ/9Ge2wb18FxRy4X8kb74eFNmGQFZp8Wvtns+DhXMX6Oh747MKxT
         n5oEaE/ZyX0TPYDUKL67dKaqlMRM5S5nxB0rHzKxOSSfV/FPkRBWl0TMvXuAtNHRUSrB
         TlBAMLqpl101ogO/8WbWgnKzGnwUXSm3jjuCuu5/uQAmRnZPMQpwAzXO877RWU1p4DWA
         m3XA==
X-Forwarded-Encrypted: i=1; AL+hErEVeMAQ2bQsObOKKBTuXK/yEGSoLjcWwLgHwK7fdI8L6v6glWY1QL/Z8/DngVpPUiNmnMtULUFtZhMUXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8A+6iMfk5meFzX9s7SNELG5ZJjvzo/YFci6HT6EUUvzbgvhiiM
	tGXe3iVBaRCwciA4TixxDs6/p+ItkdFXdXw02plmHfBjNX62trV/jWv3
X-Gm-Gg: AZFdTZfM/QdMhIbXR1wXnGQxJdHGRkyGT+kkkCSGDEaQa1l/J34MFFrC7Wq0h5gi34i
	ni0RaNhADLo0B880hyTLpcAsSp9FKLFJPoUQtg7Y2p3l9HSxkXFrZmZyWk7PMR2SMr+tfMI+jHp
	YyMeuDEYToiggPMuGupKtc37fx8QAGqq2yhj+/YlZwwbu0wj9rekaEDRSuSQF0ktc+FBfHy0j77
	lgspdZUxldhFD8q5gx+Ry1Ln2RwAwx6UbGMq6MrQl9jkkNZe27RmuZzc2/ct8+rrFQfOyvuX8zw
	OxwQXqIqhVZyQceZlUAK6+V10+BY0tOxPqP/4tRKVN3dgKUn29ovjOkMNZKpxK1alslUPom5TbR
	E1HT49UJELOTj+b2xa/ocDk8Wu+6I/Guu/LkayHuqe9vuHPdC/f4eZ6qykNCJwJQTbPhitOIigI
	GTQNoCcdT9dSu+bzVBk74TPoYLgT+P7iR0MzLXpKmlDD8mDVeVWI50fH+wZHoUG/A73We/TsKWW
	piTGf+QTNh5K4fIXyJG/FaMHNKEPenKmpMPKDK6y5tVarSjibex17lKEhHMORKuFmG8cS7iIUdq
	qKr/4h5km3cZCcUOY5q4sQnX9ligje7t0YKq
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr6879077eec.28.1795281796821;
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm22413703eec.26.2026.11.21.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: kaanapali: Add the second DSI controller and PHY
Date: Sun, 22 Nov 2026 02:23:13 +0900
Message-ID: <20261121172313.812-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com> <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
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

On Fri, Nov 20, 2026 at 09:23:10PM +0530, Venkat Yadlapati wrote:
> Kaanapali has two DSI controllers. Describe DSI1 and its PHY next to
> DSI0, connect it to the INTF2 output of the display processor and feed
> the PHY's byte and pixel clocks to the display clock controller.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), whose dual-DSI
panel uses both links, with a board DT that is not upstream yet. Both
DSI hosts bind, and the panel works after boot, after a display
blank/unblank and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
