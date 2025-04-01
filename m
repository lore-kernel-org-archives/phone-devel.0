Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA61EDA2A
	for <phone-devel@vger.kernel.org>; Tue,  1 Apr 2025 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499961; cv=none; b=ZaoDZKw/km5ji2vUkdB2ibo5HZaOuUS9B5ec6rY6B5yRincwtisf+F5J8asiKQ1a114le115RNwI1ba7Tds6+LARZuoy7zT+U3pwJWibxfzIBSK9xUi7vz/Q9XqdKZ8UI46ZJYZm29T2FeZwSnV3f8jhNJk/nUfohoe0Ko1R6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499961; c=relaxed/simple;
	bh=N1MnFFisJ8cMoy9BLzrQr7gNzud5JLemazDWM0tzY0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=rlqcwKC5wbnIvCwIx6FGVsS+EwMvEHk9TlBfWALZ7HTY7a7mNxodaHEQhWNnMYcesxEWMta1Y7KXhCFL1pitGd5eBiDEMNntRF/sJ/iDQibgGeob9S11VJDkPYUsd3P6eLRIEwJcWgShAMx0Mrwq8+KNrMYlttJ2Ovf7teXewiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q+/vI1Sw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q+/vI1Sw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so9173361a12.3
        for <phone-devel@vger.kernel.org>; Tue, 01 Apr 2025 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743499957; x=1744104757; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZBzvWcIsDBo3G9LnKcTDplA9cLCR7b0coAB89MP6E0=;
        b=Q+/vI1SwRfZWQwoY93Fy51LnPDjMgpLxg7Fx5/i/+OcCPOLJTd2S5rRZCcHmWAudRv
         q0UckMmJLRxFRPC7WUHc2fnEWhQCg3HO/sWTSFkXHnpyO/aabcc/w2tAfdirEaSMBAWQ
         STYR0fzRQpRyPgsI9SoZnWGFlatiNT7VyM1/DWCh9G4GnIOpJ3m6zWPHPES15A51UjEF
         +D/bxbOosb60o6frKyXoJOVS8mmJZZlKJcvKZOuIuS5pNffzCYzD35xPr26c/esIEKzK
         vJrBkHtJ4yCrpPZ7r1MP852RJOOoEpbScRfHMTGCVPvQQE4serwScgJ21sog3UWp0i6S
         V7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743499957; x=1744104757;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZBzvWcIsDBo3G9LnKcTDplA9cLCR7b0coAB89MP6E0=;
        b=oaDxPyBu3ZMBGfG7VqCXs9lSYHDpX8RJnvfglCiqlS8+IWVdtuk+GeJjESypMh37+g
         UN5D16UXFwYtim6d6C0zS0n31aE6Y2zayaT5uC/amxlQ9wbXt5+oGyoXtUJ6aiyaVAg8
         AdgH4pNw8CFV1OYK/ICL2pw68Ed+tiUHDSrf5vGg/8d+7eGMm1fpF1LmPgvig5Z4PyUH
         HIMansnXKKtdcaMR2uFGTAFgo05WdVS9voBv7th2D1b8GrC00AqIJqwWNNWaA/Q4on97
         h40zdpeiFL+eff8ohMZT6z3BtVj4h227D4zDNjfPTvWtxxW1wkTGDqvw0ftNDQhEowu0
         rElA==
X-Forwarded-Encrypted: i=1; AJvYcCWpJDY4q/pEA8GdFDHlgz52maghjBHVuY5ZC+5+vZNFiYK8A/fsBWU7THBsNrOngtzCwEDHF293k5eX9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sFPp/LT4lF+wRGZ+0f3ulr5MBrePt7GIwZpDASJAPNBvA7p7
	hzWdMjZcimbYucq6gZQiR29gUbQ7lttez9Z4LQe679QQ/JrmFwK3u+R0mDW9TxM=
X-Gm-Gg: ASbGnctj72I5qBJX15FHX+/WrM38NoakDSZaft8plJQNBYdn/Q5IeVPE7uCXntUXX42
	cRPqzvjquzBZVJSjNQbN+htDRrYQVAcHC7ZmX/Nwo6Q12UyuKSid5dCa11fl1111sVtemAEcsHh
	p/6WaRzNggpDkSacOpM0sJoAAiaTIGIuXwgAg3rkFzD7J1D2xGfIE4JQpOQtPYQDAIIXTrKcxfm
	tB/8aZ+jzY1/JjCzDvxUdcuLMuIgUw3OEPvtYR5DExOHYAzBld3kAQvL1U9FsMxxyAvVYZc4xMH
	nEx6Pc5La4i9n/Rr/MO/++Wo5227i2ztG1apakrYCLezlg==
X-Google-Smtp-Source: AGHT+IFiDVwfIgbHWBVxHJV1fUXGWM172/jD8Iw3qWJRy89QsLVtEytv5j6FHvB1CN3xyra++dE96w==
X-Received: by 2002:a17:907:7214:b0:ac6:d9cb:58c0 with SMTP id a640c23a62f3a-ac738b82b65mr902203166b.50.1743499957495;
        Tue, 01 Apr 2025 02:32:37 -0700 (PDT)
Received: from localhost ([41.66.98.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac78bdd54a7sm47785366b.22.2025.04.01.02.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 11:32:34 +0200
Message-Id: <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <lumag@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
 <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
In-Reply-To: <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>

Hi Dmitry,

On Wed Mar 12, 2025 at 8:06 PM CET, Dmitry Baryshkov wrote:
> On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
>> This series adds all the necessary bits to enable DisplayPort-out over
>> USB-C on Fairphone 5.
>>=20
>> There's currently a dt validation error with this, not quite sure how to
>> resolve this:
>>=20
>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port=
:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpec=
ted)
>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480=
.yaml#
>
> This comes from usb-switch.yaml, it requires that 'port' adheres to the
> /schemas/graph.yaml#/properties/port (which forbids extra properties).
> The usb-switch.yaml needs to be fixed to use port-base for that node.

Thanks, do you think the attached patch would be suitable? It does fix
the warning for me, but not sure if it's too lax or doing the wrong
thing.

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Docume=
ntation/devicetree/bindings/usb/usb-switch.yaml
index da76118e73a5..9598c1748d35 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -26,11 +26,15 @@ properties:
     type: boolean
=20
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description:
       A port node to link the device to a TypeC controller for the purpose=
 of
       handling altmode muxing and orientation switching.
=20
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?$":
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:


Regards
Luca

>
>>=20
>> See also this mail plus replies:
>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairph=
one.com/
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Changes in v2:
>> - Move adding "*-switch;" properties already in earlier patches
>> - Move wiring up SS USB & DP to SoC instead of being done in device
>> - Pick up tags
>> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-=
e6661d38652c@fairphone.com
>>=20
>> ---
>> Luca Weiss (3):
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over =
USB-C
>>=20
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 ++++++++++++++=
+++++--
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
>>  2 files changed, 104 insertions(+), 8 deletions(-)
>> ---
>> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
>> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
>>=20
>> Best regards,
>> --=20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20

