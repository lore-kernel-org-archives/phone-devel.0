Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08BB640
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272045; cv=none; b=NmIwIG4mtJSIV4mBHHHfstxNLkg8+BYeg+SMkhneMGMHb6ImIcH5cLejY0u2AfU1jb5mN7HfXEiCJscSkgvmKZ5NMAXQaDbB0gcodP7bvug4b+OyGDYjSIDj6ceZYcZZnqbYa0cQU0P7bJNNMsI2xR0k/DYNKfzI2yKX3jqD8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272045; c=relaxed/simple;
	bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxYry6V3uetU5mCy3FvyCGVHIojTm7on2whahFX+uU4i6XDZyaqKjHvTNNtKodYww6BZh0D+AfZf6+dlTZDeNxuySoQNhV1d2+JtEwLWWcr2fzqFJdSkZIcHQoNvdEMXCx++7WX8yB8CGvtvyqD2IggJdQ6BDMeTHuWQL7Zl9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkhN0Dw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov/BLwL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIkhN0Dw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov/BLwL6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YRC2145868
	for <phone-devel@vger.kernel.org>; Tue, 1 Sep 2026 14:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=; b=JIkhN0DwXxaGjOpK
	JlyvsTB+Y03yhK6pbIUAVyTVsTwTf5gci/euI+xpKunGRomDhwMLaqJXcZdKgDFW
	W4eqNHwpBkEtEt97tTtwvbBLq+PGqzhSy2GvoVvHgvuLSxe8GxBJ8kYSclE08D+f
	bW4jwSDvNN8TFVmr3xkll5gtDqnJFrJaKP2V+Bb0O68jzrUz00vt+axWoKM2DW9A
	biAHZhgFlOwFHiBirERwdnXKDE4mbmg8brs5jL1kro2O/L2UFy8KbicfXzathsOs
	3Vw3fpjhplHqc1jKTGaTMYxVa8okLRZjlFPE+UZAoJiUmx35f/bMy4iNqejUa2dm
	030/rg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8u170-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 14:14:03 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so148403e0c.0
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272042; x=1788876842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=Ov/BLwL6hc7GiDQ+PiwTilz/Vpqt/dV6z9/ozGIxJ+iPmNxVMrzkw3IU1U0wMB6Y+g
         hSMtr7ZNuulovQKcMGLjdhh2U87K1Y1x3xaMFSUvcgOrGKNIjNjQGTyS6zcriirqXKm+
         O1Ct7iVkb+6tks+LjwA2Vo/AhMXCulE2iWqo6UaavtloIrfBxOJvP67jy4ZjLvmktbbR
         Ae/FXDVq1AQID22Emd2uxiPUvzp6Jv7z+gUd5RQ/uDwNKl9s6dvOUEbkrd13SHt0x+u1
         JFCVbM9CgZU0Ybs1NYGFYsxAsUgXPF0Ty43BOSIfz/Tu0jvISBNKmStT5zKFNhZwmuCY
         drWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272042; x=1788876842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=A9YTnroSA/OTzTwchzeU7BIyjiVsPUJcpFFdEomWDYBRNPIT0q92vBWK4bd+wb149P
         s9qIdzR91y6RWg/j+AIu6W+oCuvkNqa4pma0K239P28yqAak+mS17X499mJ0qqwUIfA9
         ZWnKt7w1fn/l6Zk7SKG7sVrEohH2bvUzmS6iKTRI0rJwm2PHxKXh3h9WFbSFnnCyB4m2
         DYqap5TGYA6hw56nOQOBRr7G36R/BilCyKMBv62Sw1YVinCaok9ng48BlDriffqMasT+
         2WB8pQ0G2eE3lhWTWC6uKs5oKtUoD09UxafH9TTJZ52j+YfGzxHjunmMkP8py9JJgN1e
         j1TQ==
X-Forwarded-Encrypted: i=1; AHgh+RouIuvJjQFTN4ug49EFQJ4alXJT6DISEtJQG6/1zyS0x9OulJuPV55ubNZJ60rcGw6+Ed2E3PB8Zi6anw==@vger.kernel.org
X-Gm-Message-State: AFuF++ncarmmLKRDPtwqxHv5nEM4WWKD/cpcIgqgsSu4je6Jp54njeO+
	G/kJ6+tNiBHrfRMIa/eznvHILSTrGAj3mhSkScxMMAt+QIztXjLrKRvV5XEu7WYu3Fjsye4hYgw
	Jr0DSAUDgh7Gq/9AvPEMhzJ1W1MydjIARL0PGfm9KZRjEg8V59VNEOxHwKHRRRjLRBA==
X-Gm-Gg: AR+sD1219TcqdStqQXfKmHkX71jC4T4/57qOEI+QTDUn9iiS7vY+oVSKLynpfVOA3ek
	sfc9rMBq6NtHDa40ccefceKl93a2XdzA9F2LXxsab0axAcUI1LB94feCyKSa0F+CjyTDiDYsZ3O
	jdwKdeShyX9t1lDG82qPjfeCPwy3LvI378T2GwJ9eetiX4Ah/lO4p9ewTioL8t0Xmz2tQgW0k6e
	QZJlBh+LFQHmY2dn30Sqd1oj/nOhy0b1N373+fRw+HSAw+xSUCrrKUILaPrJE6mNcpvrJj1MocZ
	CaM2Vyvd3r+ig24XZ8xVVJcLB30xyJbmnfFqgm28G5uUCQrQm7wWj/66QV9WjCjmg+c7p/UnZU2
	xlXTZxYoLsJKz30SqXB33yA==
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868049e0c.3.1788272042348;
        Tue, 01 Sep 2026 07:14:02 -0700 (PDT)
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868034e0c.3.1788272041942;
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm601716666b.28.2026.09.01.07.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Message-ID: <43a9b8e1-2793-4fcc-b378-6ce09198cf2f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:13:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96ddab cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9ibpQ1FT5vEG8fXDfu8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX+zR6N938VodQ
 xi8MU9WcE+jAEgfrOQs34UbSXBHetVAPyiLPJC1KIOH5PSvSJOjbGv9JRGUlT7manxlqb6b9IuE
 elA/xpH2mnWDykrk6615Ew2jifUqRe86yb9DMHhiJ9CRaIRF0oVmc9ymzYYjn5cDKJ2A61s57gn
 ROA5hHwwAtH6i7WPFOVIxoH29MmF7TOSMzSLimbHAYvo6kwCwFvaUBlgdTkyBszYB7TxA9NnHds
 R/7I7vwvPzIdkQ/ioZMuZ76xUJlBz6FD6CV672f0olIWRtXyJW595D/qI9xqDbyAKbgDGjMOMmK
 jxGQUjsiBbcC7nTHeOkAn6UJR3+9bQL7sP9VOZD4kIwpeY1IoEABxLTJBIKSwfYnBA40BXCvOze
 RpY1ApjO30wVYEklENQJZNmYifejQ8FOwp6g47Hq25dS6yap3pFEZOouBZBIGq1eS5o3xpK48w+
 TCEejYvruBdzT+J3HnQ==
X-Proofpoint-ORIG-GUID: LyKqIk82ipcVzi9diR_kZE8pMH4upU00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX13HXiQWP4Hgq
 SPKUemT27doAXs8SmdSd/zG9NE0h0tDo59QnXg6fhMc8TfKbu/uSAfc/b94uGXEJhHo8l1iADhi
 7cFp4YvifKoKY5aXS+6O0rPSlTu0EL0=
X-Proofpoint-GUID: LyKqIk82ipcVzi9diR_kZE8pMH4upU00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010125

On 9/1/26 11:20 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.

FYI the firmware is supposed to handle that unless the board design
has been changed without making changes to that fw..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
