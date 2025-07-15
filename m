Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E521F3BAB
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752600906; cv=none; b=LAGdIf7K15lbqpK2jLGxMBgVgMeSJcR0/Ms4YEIkQqO6ZebVsqn5psCw/YIkCK3MWdr2tHdJs+DacWajvLkMH9WKBjpRP3eOtwNTIUaBMC8O1psoYkbr2PXANT7AW7B700izot5/aoFsM/RNmeueQR2gnNDeu8/O5e0G+1gCM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752600906; c=relaxed/simple;
	bh=2J8c2z5EXWGctgukrb93oHp2+Zfj54zLjUjpoTWXKbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8ftF9VLnNn/p9XeMJTl7F75DO2gXRntX7jNfh9+GCO2MwmSTJYFAkUFVirxIZnwKkFxLJtWisxgeHAUbaEaLgJxnvcfgymUFqjHInGzdBcJyNo2jW5D3OmBgl5GhkEjo2iC+Qm8uN38iU2DLWWn8C+14pHj33YYzT5VyqJPeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtSSWESm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtSSWESm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDdo9030485
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwHMduJFVZ0XMQsQOdCu9rTr
	BXiDOqf57dZo0ADVf/k=; b=HtSSWESmR1v8aUvbmxFz2n7lv4gFQQKPmoVqHA/B
	INn32DeLsRf5fkKXgD8Ae2eet3yealk6LUaWq0zXbhU68ttL3LRbOUs2zi9WrE9/
	BE6OcAqfBGfnVef7n4cOSUHHj8x2RwS9kz5mM6ktfYrTIHh/QVm1Mz/N5DqHsmRS
	sW5YkTnZxb8Yb1s5jWyY3BVwMJyOGf6hol4Iip/9FYjYcHI0ha8mdGWinyNdxX8T
	Z9TgsfLgWSmJepkif1i/zHKYX4mJBXsmwO3vXAdTXdS/2RMAfgCUwIULweluiAQC
	INvCL10uUOkWDMrPXwAe72ATx4/BA56yOJVCCORFzx3V7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb16em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 17:35:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2e237fb4eso382517785a.2
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 10:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600903; x=1753205703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwHMduJFVZ0XMQsQOdCu9rTrBXiDOqf57dZo0ADVf/k=;
        b=MAj73+SSqaEE9Q3w86yRi+0/g4p4I5DATiOE9bYRJxlzQejftJZ/Z/kDxrpA3L8axe
         t2u+fSTwpDkj43Nc0XfxyZ1/zzBeWNLzRFjtMk6qLw3bjvpFFESBTKpRJuYrK5FxQGA3
         pjQd15g6Tp/4/cDcsRfzuVVNE4AbHd7R43iKVdAPE1qplsnDRc7F/Rnfj8KgV0x7Vluw
         yDWbpgRVHEGZbwM1LtkX/OOxL3uvhs7bEe20Db9vK+ZLBF7KNcmdWlxC6HPCg/ZrD0CL
         7Nuzmm1cdRPCcwEGMWJ94XwUhWK8goK2bFyXEzoJfto9HkvoKZwkDEqHU/ZuW2GCcPfg
         mXuw==
X-Forwarded-Encrypted: i=1; AJvYcCVY5XyJ6rr5MuVv1mNQ0NEHcL5Wg4MGZ6ZtgPXIRXo+IVnhrH3wHLcxBKbnNbdCwMrlQUHhl7PTjR+QZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQw61d1HcDcETaFpUqIOogilUlzVpKxEFKWqbWlmB6gbN4xJI
	y7d4HR3HESQDlJXAtN+cCaI+csVoLcRxdglV4x+yp8ljeI6GJCEwhCjmTSiUj0+wu8iBEVwdSve
	gzCPmtB/jYa4eSkkv/WZKOsPD5c4PGuS+M1jpZbRSEQCmj3/N/8ANLH2V88omBECXeQ==
X-Gm-Gg: ASbGnctOfQemMH3zZyGKMUviD9TEqwjmHjEiYgHuEaq05yZuwwOQv3XZ6aapxJVyKmG
	VJDWPT8cCVfwNmyl+TiVUhj+UodH9gFNzZHfycJ0d9rfsQE2Fgv8yT2ZsGld9lvSPr2ZLTMXhHL
	t0Wd1+CXtVWsGTV6k4+Fp6tSeKoiKhFkydt0SRMr0HumnpickwKSz5LJpIrXZVdAR4mjE+yBlQG
	U1PbfXtrSlDPFIexfJASUGaAw5N5IQB4Vm+cTdkH89JN1zDpg+crYQh9Pbne7zLY0Cc8cNcgcOM
	yh+N3WVN44Nh5J1oyXt0YENn+yRImJVoCdh5u+Std+n5xodH+E0QbMzP4EGp1CiHp6GOXhLe02F
	wN25iEO3cPhqMw09korw+anu/hi1VB4Fg4CedmwPZBaBb45w1n1RT
X-Received: by 2002:a05:620a:4513:b0:7e3:33af:c45a with SMTP id af79cd13be357-7e333afc5a9mr1078301585a.49.1752600902904;
        Tue, 15 Jul 2025 10:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkC/RAmmlrlOop2nd4cM+Qb/s+gLrKuUEGXd0Hyq1/Zw3CSYcbKVNpSB1ZGZ2gTFs/qFsWQ==
X-Received: by 2002:a05:620a:4513:b0:7e3:33af:c45a with SMTP id af79cd13be357-7e333afc5a9mr1078294185a.49.1752600902369;
        Tue, 15 Jul 2025 10:35:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed429sm19601101fa.85.2025.07.15.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:35:00 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:34:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/4] phy: qcom: phy-qcom-snps-eusb2: Update init
 sequence per HPG 1.0.2
Message-ID: <n3khphjtqwcfhzxbdici255in2cbceujp3jlrtkrqsd77jtftm@ggpa6eek2xna>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
 <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
X-Proofpoint-GUID: VeFkqfWtL8y36rTnyY_DADZbuoMVNHDi
X-Proofpoint-ORIG-GUID: VeFkqfWtL8y36rTnyY_DADZbuoMVNHDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfXxIibzyGuGkl3
 lm+JWNnKmMGaq/+AE6B6RC6tI0w0/9gkyszaAWT7QK7ZLSApxQPVgE2vgtuqRWklFKu3q5XomyS
 eyU3FkT1tOX8bSb64Pc/5b+GLGw7X/VK1YNW8zuTEy8sq6Hx2w4mY8HuKM1FAMi0kaXp8RcQXwP
 y8VrDMZ5Vu4uXBqzBaMUQ+xkkOefdRaK//C4YCyTEj+Fq8+L6A/PKlt5+h3Fae4zpTecNAlkIHa
 QGkm5bcgkZZGos/QxP77dEYcLIFnC8bpAxOUcJkDuMoQYeAdypXlLxVvkNlqcNMGxCYMaBooYcT
 qL/L51rUmxfPXRyAO1WTw/geF+o/AFjJfm0qqRhGqpY8pMU79FcLhOH96+JUyUV9YGZbnyVeD4k
 xqvhSED/a40BEjjkqA9t7fQFISK/jhsYilQ1yUSIUXt4kwvnqQCUgS/7uvNODNyHPJa/IfX2
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68769147 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=xixfk-lNQEsWtM5knIAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=954
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150160

On Tue, Jul 15, 2025 at 09:29:37AM +0200, Luca Weiss wrote:
> The eUSB2 HPG version 1.0.2 asks to clear bits [7:1] on all targets.
> Implement that change in the driver to follow.
> 
> See also https://lore.kernel.org/linux-arm-msm/7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com/
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
