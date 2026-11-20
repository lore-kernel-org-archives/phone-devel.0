Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160043;
	b=JEhxSOpzy51lyaAZzkFfspHuIGBzyD/Z/alLRw7y71RLF6kchoIiXVrosTEjGAWb7weV
	 YsGvlNj5Ni3Vr9ftbbG1/daZ/ZoiFykuan0dl2r5T+UOVk9GD0zXN5dFFjsG76uGl2owW
	 0m180BpK7V/sw/D65UD0LEc0tSx+hjxMbl5w4MdMxLEO7vTZ4vE2JrUl+DST50hFBUsIY
	 ZcrSfM+Obw6KFhRv3UaMMMmI8YIIuYHJyyUAi0QfhsLsrB/Q0yqPP3NTtd3J6Rdx4so8x
	 PjRbns8dqYx8WByjxbq6FvJ6PDXOexX1pCa28jUIgnqDLq/iY6W4SDSDCocZfVrEbXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=Yeaoj0qZBXkXysYIEmgpKh4NNZv1mBTZnc6R9zrhqHJhi1CLZjKFHB8h080L0J5AEu+T
	 T2GkH7LFgtOWgJcINPH+W543tZQyOj8QWXQq+ZddwMPjZMRU7TGDkHxPdX7D9iahJ+BBG
	 8az+qPDcD/lSEpqrDriXFdYSDgOxd0tL/TZnDE+0oiWqglyWGZGEF2PEA/OtHqfZ0+A3Y
	 r4kfFbRBSvXKoZUgCO3KtD8Jb53tNUbd9X241OJpaVuKeLZs+PPJFl/AtES8ooWVJLgS5
	 i0LJ0tzkaGW+w+aUMDVMxVFbrLqeLb8YJuWC+sL5PNNq9KGiRkmktsYTl43m8Cz4lXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B760A2624
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3B760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so2627995e9.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160041; x=1795764841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=Ac2qP8kZtgMyE/fP0ZMJG+N+JUCH4QENZ/z1bfsgbihnepp8xs5U1n2OVY2dfM1Ybz
         8eL9nbD8ajZ4xAXX5Jyxp7gYiy00V65DPd4lvr1WAsKMEeB98T6LxXPRvnVJk04PidcD
         BMspLbHPsfTy2TciIM1ZHJ7Uu5HfkTkWM3A2FQpA9P4UW0Q85AQTlAkl6SUwwhB9HWp8
         weJ5Yjufokz1DfRsoI1HB09H/j4MHX83XDecIRETVHcTbm0Flzp30A28S4b52j3aC72u
         dZSBlUbcdaT92aiYk5uXidatSk2144fZfZpYQDrsaNhNQWNUGI7xQ0QTjNAeAlB5X3a5
         9nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160041; x=1795764841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=rTkQENABc/pGRQQxH9zSiMeZJaf/wXd3wPRWPFvmo2WeRT5HvVmiPznvM6pS6kt8wr
         UtZ/a6QuKPY8wZ8dDppn8r/yaVTbK+r7BirGbK3I/cRymjhxTbnzVrfTELAmiFz1bB8r
         cPtvYmYZFPL1H2JBuOc2A5TepT+ie8H3J/eixsCNoyrfmOgPp47K/uzV2KIJymEGxsca
         Sg8JC+ToenG+c65UEt/eW/2DB88B2ESMSYbH98AdrvP/OotYYSge99q57DbwLpQCZj1N
         aju+6f8JO3gnQ5yxgKwDa7ZaqOCQkht4We5Wr5svNdrl335F1LzASkbfxp6nWiLTotAy
         xhLg==
X-Forwarded-Encrypted: i=1; AL+hErEJfyNN+G60oGrEWZ9+soadFkKpyGTe+IfnCLDn1dyZoog6/WjJAeisNl7DXFX9c0QW7I0v8ulHKfx8Vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9mjfORdKfWSvGilnsM6J2btPPYeTgBrCiFqgbhuhOhpwa7QYPa
	IYqQ2FMabt0DUm0SLJONe3Erqbgk9rnRIsyYxKhjfzsLESIIG/2E7Yz8
X-Gm-Gg: AYBFou0Pc8eO6BG+H4UmfvaL/nxLIb8kMKNd7t2yrfjj8TPgNBWcgH07A2qYcnct2IP
	ULsKwG5ZSa78DXfuFCcWrbWXX/a2MjxKPmFM6XiHVEr4XjPYtMM3tjIqXR2yl9jKV0uNdpncYPj
	djWPbNX/r0pLles2SVGI3mGzgu7WTGv8GCmkslVHyeObjuxmw9ruVL+Dknr8lUohD+Osiv/Nwl0
	O9UO61S/Ed9Go7/CAX7Lw6M/UiHWODvBuU/jTNi2w0aX6jlkpvGFWbsPzDBW8LH+y6elAC2VMY7
	/EFUXqO9F8ueMK0p6vyfOJlgMEokiMVkMZOHeSunt7GJJAxsNxLjrr/7PumkIGhoeWHR7lIiMj9
	AvOO2HJElN2hy0ZUoB7tfz2awzbVsA+3mDqXRfAxy1s5kblv1+1y7QaoPvRVFFTVuM+7JJWp1rH
	QoNgGykor3PYnZHjwrth4Ug+lHQv1vC45Kta1oaaOffAU2etcYx4oP3qKCojUqJi9nFw5fiO3TX
	CyV7o23XHl25pQq/2ryyrciFIUYlnAqiixk2NKNtrJT4wA+yuHo/YhrC6IDF/rjvGGVajJibCKc
	ZlazUuCiRjWAqHb73mg5jLYt4ra6dEhGF1l5X+OPGEMJKNyfH4UZn1V44cGUxYOhqSWbo0qxwR8
	=
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr41369415e9.21.1795160041183;
        Thu, 19 Nov 2026 23:34:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:00 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 08:33:49 +0100
Message-Id: <20261120073358.10267-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

