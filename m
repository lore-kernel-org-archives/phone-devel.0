Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477778;
	b=xRXoV4fVLcapRC0C4aGbkmFQUl3jksODwxAv2dOfjCRTeTikQuy/Lmweww4/KmZS4rxn
	 KsaXpnxPiCFcUHmfPmZDNCj4+b8LSjaH+UVDsmDKHeTm4o6wqEQedIT0tAKJAn4miPiUw
	 kiAzU61d5ag53hEKXlwXco3qbJeNGfnTHbLf8TGFvSIkg7ah8KMcyqf6WJ1aWtpT1xqye
	 mA+BDzf3WhPrp40wcFXO9XDMPT6rNYIBECXQClirOTYVdBv0q/1DEU+o/USAxg5TLR8N6
	 IR9/x/0TmHC/SlrL/Qcg6xS69Ys5ExsgLnl7It7iXkklIe4WOm1GTx0jcSKz6UQhgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
	b=qpZmJsR3AFzdjg16srPo7sHqAy0gUWds71Chh+EnDRC6WtX3TfFn7JQAsFOks5+2AJs4
	 gqEJitzr/SlhGqPRE/YudFX7stnVQo/QApFMVyODAmd1by0cdZUKCmzbc0tDyRYR7zmvL
	 90g8CUwSe4Ybj1eSLKhDOqlRhXsHpA6UqgVBAKCNLroNs6dQvHu7BPMUU8LltYZ9Wm8fr
	 XoPKYnbZ3biH6p0Tzcp+nx+supaRg6HIwrvOdtUYPGF5O5iM5vdf8dzZQrl2NANt5bOVA
	 Ez8PrLo5qvWeYyMeqPP33VcJprH3VhWBSZ4ncQFE+Sy8+Xv5s9yHkRAd4OFwazRWi2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96350606A31D
	for <phone-devel@vger.kernel.org>; Sat, 31 Oct 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96350606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFuoR3560603
	for <phone-devel@vger.kernel.org>; Sat, 31 Oct 2026 20:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=; b=VygcVeebGI/ri9YQ
	fhErQBAM0zlmBh+3G/AO6X8Iht8tVCCqHroXDlWGB6A5COKcG7ZiiO8NAwwlh9MY
	y26uUS11faVLGvYd7XQqcamy+LLSsWunkK/qlm7Vcni7i8QpXdGZf6uzxxNC7iN3
	qjqCJswC6pu/TFUCIOIzw0OKktEhsxqyiGoKknSR+ddBhNfsfopYl+4nOoYJ1Z9B
	DQ5TLrLIbNOfcD2SpxBOdFlSkMHMVhCUYXVdGk3XDZnIwgZebB6f0Q98XaXTU+nc
	1lzPF9OZke8Is/ceATWUw2dG4/vW12NQ5+7cOSJ1tXI7wUssJR56QVSWae/93hT9
	M9rkTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxj1ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 31 Oct 2026 20:16:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so251976585a.3
        for <phone-devel@vger.kernel.org>; Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477769; x=1794082569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=bIVanoOa0vzaexjnqqPTRZwjUB9qlv7AS9w0wC9RMCE2R+KpbKZD06ztEg71CvJhnv
         w/RDzNowSjy45ImSh4Wypu5s7Opw8lyspYrWaRqndA2qnqQaZcTj9w0HVOC5e85O2bfj
         at9F3ThFJUpL8o/qmSeuDyP8NVmEPuo6hfdDjRxhepTaJRsEiNG+DJeV0tyCm4b4bUt6
         P2bC53GnI42AzIarj5DNIg3a8Xn1wa1PWSA1i0wCc26lFlZzg7V0lBPNyb0GIB9yXbTh
         xvCpaOqVKPsrs+3aCVYYYA+62ZJOe3oHg+F8oVeA2/yqWMGjhpA82NUN7RjnGgztp1f4
         Jz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477769; x=1794082569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=AIFhq8WKxgHN2jqgQpfMQ4h2CWhc8mCiD0ZZyu86oYU609BJAbSL7WH6lFZgIBiLt3
         kiMf4CIJpU9X5F6T3zMOSpZXgh4iSFwYF4wiCGHZL+j0eNLT7gIiH8Hav8Qdf3lI1ljx
         0UMy0dWptgVVIshGsUW1kbRV6NUi/m1r0zIVPS8QfqMQqm1YPGDGDEv85VvreMHD9wtp
         TUI2uzWsY13drnz91JoMMils3KLGx2Q7s9DJAqTKLO8ioVIhExVkjvfhvUja0LbL7b8v
         mNhxnbHWpWUOeh582mC1XcrNvGArUOiAUDGbBwAYz+/PjWasGzv1EVhpNMywT6qhEQ3o
         TJuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVLn+ofdqgxsS08XXAQNB5BT+gmAgs0ieA1hnAjLE7ZZ/yie8zOy4T7euiuBgNOdxJOhdU2+q7y2pn/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5XprCRwdLaHwxciPrzCmFpHPfVsqJVI/IJmb9yPX2mNhyGMZj
	5kS1wQnxL5CdwuGopU0REUzLZpV5nY8HtqVnKH82Ys8BRWUaMmgwVbpyb0Hb+pHj7tg+YkeRcxq
	w1FZXTHauaIXFtC/e8Z5Z8hEwGEd95pApSlgZRhtnhj+lbArm/O2osW8tgs0ycmJQPg==
X-Gm-Gg: AYBFou2CBnvx/b+d8B4q/DnhLrDNoGxet51PLmZ5xHJxsmEoMSlpyvYKdF/BJat8Obs
	wdguYuk9MhxXkCzFQ98IWckZicabSTbfmoXkkWfoa5A+goCkTlUNkFnn6fPVkvFUsT5bYhIXuly
	nO/DvKNc2OphS9c3FsNBISrzqWwNNymhU+5THX0xNgeR3QFKCIF3VcXBp0rJfVWcMju4mv5cAqf
	z1bn66h5X2Y3luSV88WchSFOV9NLrUuxRltv8YQ5NwvPcYbHTIA/TV0eVvKQXSxMtOnVyzjYzrU
	BBLNYU7VCQDD9DEDJguUjmIutAfunNsVsesrY9Sbg5b/y8zwxhBDw/8AXjwZoZ5oti9ug738pBg
	ESesYyLv7EDaPxC9C2j/ABpVDF9+Qj/J7NM8dh7s8WO43/YEfz6+gkdbqVlN+J+CRLCyX5jgr9h
	VopeW73C7Pf2wdkUGrBT6KZfRlpvqG8zr+8J1rfr4Jvcj3h6VxAcOnmCfgphyhRQ==
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055212685a.76.1793477769021;
        Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055210585a.76.1793477768621;
        Sat, 31 Oct 2026 13:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0752a30sm731130e87.78.2026.10.31.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:16:07 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:16:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud Ferraris <aferraris@debian.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sdm670-google-common: set chassis-type
 property
Message-ID: <ucyymr5uvakzqalebjvx4cnxaqi7d66urnjcogjm7jdgcmohu4@63uj25mpulyn>
References: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Proofpoint-GUID: 1y3oGup0auonyWGU7JaSTCMabqOVPfzl
X-Proofpoint-ORIG-GUID: 1y3oGup0auonyWGU7JaSTCMabqOVPfzl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX4vRNbM+vLkFp
 uTCh/iGWiVKdBOvyu9chahE+5hdKQHDSIaHrLR6oXNseq61VGjMw3fU9th4vlTNgnDDMY4ziYyE
 /siyFy47Uiwgokmxb6ZiXLwOW+unhSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfXzhKey8lumg4R
 M4lf6IHwMzZaCXLGOvMxtt3gAWVeqEIhKEugHVlDZg65LdpDhypjrZMOC2/3M2e4rZNQ0Tnr85G
 USp5/R/qCLd5e76BstX6bEGKP7TfBac9WW7SceDVAQJzSI7y4DvqOMAKjXxWvU2qO8/hYzvIXKd
 G6yipUxAkp0B28INLG3tYQWz9d+FVKMKq7GAVfqdqI43o34a5V79GUCnR800XXSvzzga9jlxMEI
 G6IEUo+ehR01qq/xIAO1nKmjUTz8E3dZgDvTsrjsDATVq1qlp8fb6oXtqyBiIsI1ZwHUKcpynUn
 8oXp3DnFHLCp8o3PQDI/3mu6aZLoA7fw5bEbF4gsJnZQeJXRraSo3D1TWS4lGsrk4nDuR/T9A04
 jGnmHTbqSf3aurjh8GmcOgpqIhrAm7/mS8ht2m5jT/40+tdY4B+lAYw79hIU95cXtqG2U+WNsBl
 q4/gcnzYfvgfB5a/o0w==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae64c89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=xNf9USuDAAAA:8
 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=2Uk1DsieHeZNntOzPjsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310080

On Fri, Oct 30, 2026 at 10:27:38PM +0100, Guido Günther wrote:
> From: Arnaud Ferraris <aferraris@debian.org>
> 
> The Pixel 3a/3a XL are mobile phones, we should ensure userspace can be
> aware of that by setting the `chassis-type` property.
> 
> Signed-off-by: Arnaud Ferraris <aferraris@debian.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
