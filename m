Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03ED1E4A0
	for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708089765; cv=none; b=Hm/isGLv8BsusEa8dQnboIwMf3yZz/hHY/NIof69+niN5kwcLBS8UwhF9SKkWyJxXl+AsTZNO5kFI3S3LwpfJBMiAG4xSNrOxdfKC0Q8cOR56xBNWi7AsGATwDOS8cDU47+CrGNnJK7p++xnkG3nT9OHCg04KC6HaZoxFUB6KZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708089765; c=relaxed/simple;
	bh=FsNmchVQuTTQMH/B9KKVO168bioDU6bYqSApofTtot0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Uk/1XsRCrKxfoGKaofT6KC+Myg8NFVTqbndALGZRqe+RqOsJm50Oe9For8YmJyDZKikp09HF/A/eLqmtUHKRDMIBUu2l571/5mDLENXyEGYsm3ji+ZyIphBSQIj/IcfHDdm0xWvuQSctdoe5wTyai7JcUeV2viEckslb6r6x0Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eHKPBkH2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eHKPBkH2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3d01a9a9a2so189244766b.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 05:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1708089761; x=1708694561; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFDoU4DI8sHTODaC/giqLy7tDcjeeFmno8f2AA/diI4=;
        b=eHKPBkH2tMIilq4kf2bVe+e/ZL9zguR1zfgq62EbyiN37NgFkoS/11M03mJw672bWS
         N+P9UTArMHbk1D44BdD/JHqriApONz5nIgW9qpKwOQYfz0AG/svStcyI5Cjrq2P13vwX
         cqjI2PyXoc/Xg72bkkJnbAWPa2Slh58QfB7dqNTWSJQqwIE6YorRYd6GLcsgf05bdsIm
         CsQLyUWenYGxwKiaNJXNpcT0rl2YNd2KmO/7YqDe6sWvKlBWegDJZC6hvyyP3mjv+OSX
         O51xxt5BCR06A6WIQdz8gQ5B7AZl3AXxZsaLBs7pmkiYiZWYy7heieT0AtKX3QrrIpxN
         Dnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089761; x=1708694561;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFDoU4DI8sHTODaC/giqLy7tDcjeeFmno8f2AA/diI4=;
        b=GHFS4L2GCbgQMFGWJ9Tt2Xv58fHFtMCGq6jhryEEJKr7J1NvNa836lcs5Ik+NwjCtM
         69C9uf9fqnrtqU7OvDEB4JZlVCyncqGZROgxY0XbDH2DAgwkf55lD1TYb9elz2j7VAtM
         /orUxZsqmKM6dgSdN4IhJFps0TFe/vgaImwTRgiMwKz7ezFmXdiJW5yheZR46CfeH0U3
         zHi2pHEiBcPaFKCHdvRO0r883tJmnLiWqL7gydg5QU1b+/DQ+KNuaAeWLLBRh1Cu8kMP
         1qy6c9iduFaJ4ZH5a2kJlCr8ry2tPW6fZRbcuQHps26FqJUnJtdZditHw4p9y+ip6A2C
         hfbg==
X-Forwarded-Encrypted: i=1; AJvYcCUyUFGPoI89eZT7TsL54fQsstn/MH1Q/vf8U+KkGiqA4dkTth2Cln5ud7nQfsLRP6zHz6UlKAjLNMxeXRMWmFNVey2o3QriENi+lXk=
X-Gm-Message-State: AOJu0YwEtLwEyE2r6g2Rf6pWFGDVvNgg5nzZaJ068PYipdz72AaYoqR+
	UG+i5n9AsyZ7xhfpQ26QJCAjRv9I2zt1gLIaDfwWhyBs3roR1oS9bcOK8PbBLnw=
X-Google-Smtp-Source: AGHT+IHMkALfGXBfUoxsJpAiTgK6gRswQPXjfjP645gXjCyLE3nug2dYR+7QvReh0nh5hW3kChm2/w==
X-Received: by 2002:a17:907:382:b0:a3d:841e:3d75 with SMTP id ss2-20020a170907038200b00a3d841e3d75mr3286997ejb.61.1708089761265;
        Fri, 16 Feb 2024 05:22:41 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id gz15-20020a170906f2cf00b00a38103ab710sm1553060ejb.125.2024.02.16.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:22:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 14:22:38 +0100
Subject: [PATCH] Bluetooth: Add more Bluetooth version defines
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-bluetooth-defines-v1-1-6c39aacc66a8@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAJ1hz2UC/x2MWwqAIBAAryL7neDag+oq0UfWlguhoRZBdPekz
 2GYeSBSYIrQiwcCXRzZuwxYCJjt5DaSvGQGrXSlNDbS7Ccl75OVC63sKErTopqprkrsEHJ3hCz
 u/zmM7/sBiaEz5WMAAAA=
To: Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the various Bluetooth version identifiers found in the "Assigned
Numbers" document[0] from the Bluetooth SIG.

[0] https://www.bluetooth.com/specifications/assigned-numbers/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
To be clear, I don't have a use case for these extra defines myself but
some time ago when working on Bluetooth I came across this and thought
it would be interesting to have the list complete. No other motives.
---
 include/net/bluetooth/bluetooth.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index 7ffa8c192c3f..818eb142eda3 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -39,11 +39,20 @@
 #endif
 
 /* Bluetooth versions */
+#define BLUETOOTH_VER_1_0B	0
 #define BLUETOOTH_VER_1_1	1
 #define BLUETOOTH_VER_1_2	2
 #define BLUETOOTH_VER_2_0	3
 #define BLUETOOTH_VER_2_1	4
+#define BLUETOOTH_VER_3_0	5
 #define BLUETOOTH_VER_4_0	6
+#define BLUETOOTH_VER_4_1	7
+#define BLUETOOTH_VER_4_2	8
+#define BLUETOOTH_VER_5_0	9
+#define BLUETOOTH_VER_5_1	10
+#define BLUETOOTH_VER_5_2	11
+#define BLUETOOTH_VER_5_3	12
+#define BLUETOOTH_VER_5_4	13
 
 /* Reserv for core and drivers use */
 #define BT_SKB_RESERVE	8

---
base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de
change-id: 20240216-bluetooth-defines-b810ce543191

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

