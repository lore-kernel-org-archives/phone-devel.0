Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575363;
	b=11i6Pbq7zGQAdUkagVC6C6AWpdue0ykqrrvZoPwycJQ5+edF40w/zNJUS2H19S4g5+De
	 bC9xrcTAaN9W2fwOaAqEEV2DABZRXbYjK7vzixzyxYLaRLr/8qXGRBEUhE5NSU7QkJPph
	 L4q1YotnKCrsgiYcdzymYLA1IrlGqz3dv7FkF9SykYw6inPn1U/Qau8fehfa22adQ29da
	 lrj9eT6XD6QL0JFiBFaByt84Dw2tbM6OXM9Ko9xgjd8RZc6ERTGl2KJ/ObgOUlbk5ZDU6
	 x2WnLJbdEldO45E3OXWxqHWMY8zNBSFtOSSEsOWFk4QGp5gUgwSeWHbMyrm5sN+sntQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TgkZPDfiJjMh2J8e/Fv34yjDTX8rPL0Qo9+0DabzE0k=;
	b=a2ub8gATO5PnSwsF12OybP2/m/nELfb/sRsbm/vKUBAfwVzzIrCDp9bOCoz9xmZynR+p
	 xSPbOEmFtw0MSTR13GroA1bESeSuZT7RUy85FiJ3DdP6jGHmzHHls7q1YDMve3MvJ+yia
	 2ZIWeVo94xd6cMq6/dTyNWI6+OUx2dNrwIs8Abh2ER3/d7c0mXGVo4MQgLJu2QPyWoS1K
	 gbsj1UQrKLrhN/U5sOaz4l/Lv/aiWws1kEUBTTRvVymsT+2hVQ8TYvc4kbrWaGVmc7Y/2
	 A1y7oXJ5d3vYP+dSF8LA/FtpFjkUzbFcWlRnr+u6PSr7ozGbUYtPHWvZPembRL7YXXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NwTvgcSx;
	arc=none smtp.remote-ip=91.218.175.246
Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2407606A32E
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 13:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2407606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NwTvgcSx
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n6h5sbKyK6McEKrI8Ar5CJ+toQhqjA8M6q8V8BhhvW4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794575360; v=1; x=1795180160;
 b=NwTvgcSxn8AY/+67Sg7b8RjgRni0YoEnbPQBc4O24To2nFZI+ytKa0ofJpRPTyFB9EeHpfmI
 4wsQY7tOPf8QsbAPViKs6kyQygdtrzYZ4xqRkEj99iCNV+LlppDKrrU3vMGmhJllmrUj3JjgBBw
 wdPnOWLkBjMtRCsqR5+tsaXGyfjTRwjowK2ZSy5eeVIRcGa1M1vlPSSgbaeZfumWe0JiRK12wmr
 Dss1LW32CT0P09CjGXidT7Ua00bRbzoT2t1Vm35817v0YW+joxkVsh2g6JIsjbCTwkxY739jMOz
 lNI5nsBPz/8bYUjUJytvfq6l7Kr6xuDduiwgj9xWgQ2bQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0668823f57e9852;
	Fri, 13 Nov 2026 13:09:19 +0000
X-Mizu-Trace-ID: c0668823f57e9852
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
Date: Fri, 13 Nov 2026 10:09:13 -0300
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/26 9:59 AM, Luca Weiss wrote:
> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>> we can turn them off and on as desired.
> Actually after some more testing with extra patches, it seems that on
> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
> on FP3 it works perfectly fine.
>
> So please ignore this specific patch for now, I will figure out what the
> problem is and re-submit. All the other patches in the series are still
> good to go in!

Your touchscreen needs to be a drm panel follower and/or reference the 
same supplies as well :) Most modern touch controllers are part of the 
same physical DDIC as the actual display side

