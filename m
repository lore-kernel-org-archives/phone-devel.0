Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B80F3590CB
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950788; cv=none; b=OqchGdGNOkZDWtP2YILHs22fpD3y/Q0jIJzIXxaTsA2/abRr76hWMlqzxsBHX8M6ZaMaLNICd0GLyGKeEg5VQ/ok4uj0zbMvuC7n0xZP9S9+HBe95McBZ+TQj7fjEReIwlqgv1qYljsUSQcMJGtLjU+dY0lqvPWMB++iGGRkxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950788; c=relaxed/simple;
	bh=n/TG8MO6HyiL8J/XwIVaNqLz0iR+l4eo3PBvnTrhxes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib0iE774i4iWEnkEh34YHgaYHY5sVIbD2OWFE4FEPvNS3A/XORf/MINwYCFosO8x0NXfT1n8YBbDyFbRREetHBsemJCaJJjIySo7XqS10vo41mXHsF4TPN8jBC5DF/7ec7qDjEoXhw2pxOrAthb643OoDnzUmyZJujUhEIFMFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpsAyHRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWQfTt9t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpsAyHRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWQfTt9t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098hGCB3727542
	for <phone-devel@vger.kernel.org>; Fri, 9 Jan 2026 09:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GYupHi9hiffcOrLcYrkERu+8
	TOtiFQWC8OIKZvLgLzU=; b=EpsAyHRml+EeiIqmsgWAs1OxeWytrrAwHkyIGuzN
	U+Zof37ZEcsxtVOWMxe9ZKs8K7IJ3PrM2u9EB/7DvB+xLXzf0C899TV4+w6nSlc1
	Iq5ApL4+rMhIfxaaKPA1mkhNtcRWIK2HoZiIBx+DJ1P5316AZ2UH7TumeNXjcSP5
	LSDyknWvrkNmjR+QP+BGekArlurHYAYOnT8lJi5H3opn1BMhPU4Q6zHrFdLxLtZG
	xCyVOIopHdgP740bHRyYtm5/yFHZwXup46cDy2OWshKhmc/KGBbBfoKZ0l+DBX1z
	/4Lo/KkUOCYboSPcpXmFRM8kOMkHOvYxgvcbA3vUUC28KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhfre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 09:26:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so783736485a.0
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 01:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950785; x=1768555585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYupHi9hiffcOrLcYrkERu+8TOtiFQWC8OIKZvLgLzU=;
        b=IWQfTt9thRjXPzU1wuxnzTKhoBOpga1zlOFQ7BOSYhav6n9Y5OVu1OR3O6VI6WAekj
         Hlkiu7dWgrpIHF6fygrw9Ch4Dl5pLtR75G9IH+0baowb7fY6wp05fQKANf5ubuiNk2MR
         sy22V1TJ9X2BP7Q+64SGnFtepVAs0Cpv1q51Z2mgizKq52HRctNdiM51W/3GyjQZaPWI
         Dk3xe0vFSvv785h27ZrzUJHtnDMd4J0sHUWxba4+pWdD4G2rv/rCUoMWFQtWQwK+vAZg
         spExXdyjWWqT028IrHrx3BGk89DZVjJx4r2BP1oh/+LR5wSoLQGzgH94L3zflvuvt5PF
         3s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950785; x=1768555585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYupHi9hiffcOrLcYrkERu+8TOtiFQWC8OIKZvLgLzU=;
        b=uY+VIW1UQm93pfLBijZogY6AcyLseT9zJk+hKQB81L1ekeIkCNIMtIMoWpL/1f+XRb
         D1NwSO4+qh6YkMtMmzXO8rrKtq7ZNOW2gCGQSm5ukyFxnvg1MRkXTkdOvf9Wart0dw/D
         8BJEFUlUMc5x/MBh2YjALmKXEfdiN1n68LaVGzLfXNtrpm3t5oyIwu/9nFrYl5qg97xx
         YCGvESjLD2BT1dIi/D6/0fQPRWtgPy4djIwYOcV7rApGLoBPRmtf1viIvR8mtm+hQqAm
         9GlQ3d8WyohKlBlEXDlFmAvj1/0pmO4LGei3JZ1benjf1cLU9+mFD5Q0W90/o1pfokUH
         /UdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtgm9aMFy0jlTRu4g+biHjOjDt6RK4PrfRzAw8/gOijMVzTQi73Kl9Xh1KDShqoQ/BSMdp9fVAgX2v6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtukdjUqz34MJPeHXUSpOjN2mzpKZLmevLzEkEutj5JKilkDi
	6RO54I57hUh4/eKh+2vs7CeVvxfIXUiObbnNR4/fu0sJyTL87BO3O6OCKycreS2GlaVosunFU5n
	aYg0MjlQbQSEG22RcSNEoaDHAol1I9r0DSePTu0kY6KLCE2v0DExc/hdfhqufqCGovA==
X-Gm-Gg: AY/fxX5nV07KDaUNM2UE0xqfGVoH1kVP+E/WA26Q8ORby63TktWLAzEOFI12X/RT53b
	MmoVBAFIEXWtMflBugU/TNeDu2ShYmOiIdqr2CbnB5fum51PZSHXoQjcHObnWL+WLLgburIZoJW
	A/53GNNxJDm47kvCZhcL5qZVe351SpAc0PnixDdVQVn5EJo4BGZrt5fxWn26AvdctCTETbIexML
	bffH8KZJCE6EeMRql1CDhgTjOfTacYchjLZfbd+sJ5H03qLIEpC6Uzag3M5i/RzbWtWeiyUtTMB
	3cxgXdich5dJUIiTduGs3UH3HBOGG+uCOe9/0NnFp98bsgADhYBBxaesSnNr+PmdG0hYiiQw4v7
	rsSsviWhdsdzdFzkfjffe
X-Received: by 2002:a05:620a:28cd:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c37f4c2b5bmr1694839385a.6.1767950785219;
        Fri, 09 Jan 2026 01:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqk8xaUlwvb+pLU9tqMNDnyTuej2+CgVW+rsndOdKz4BuiVC9qsdOjh+vh+cFbcIpNWeJ2+A==
X-Received: by 2002:a05:620a:28cd:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c37f4c2b5bmr1694837185a.6.1767950784625;
        Fri, 09 Jan 2026 01:26:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719e695sm56927835e9.17.2026.01.09.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:26:23 -0800 (PST)
Date: Fri, 9 Jan 2026 11:26:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/6] phy: qcom-qmp-ufs: Add Milos support
Message-ID: <5g7g2l4x4ocpw3hx3pkgdwrboicxnih37zxvvbfdrp5hw7jwai@3ybokrxepo5t>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c9c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: fQcsRMn-TXwoYyP-ELjBE6Wn37CGkFLn
X-Proofpoint-ORIG-GUID: fQcsRMn-TXwoYyP-ELjBE6Wn37CGkFLn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX/TGzizDEPkSJ
 6jIujPfmZEIeiQtIqHs9FKO+hc1M6FGHmsKkoMMRHi+yzwP+ROsxdcvIK2BLjJszhxuA/wQ3C/b
 mUqgiNTTjuPDRJ90WblGVMG93Rhf+E6UB7N5tQwcj1e6mts8YIZrY0UH3OT7OHmBaK6f1/7wLB2
 xhCdsEhsdK+sEygNqrMZnGJMNwpYgJzhrXiMhnNasRwfRwsppmjZl2uWe5b/hn7O/VQoNXKYyXA
 esqDsIby9Arkdf/XQiv4Y9WGrJdscmrFIjktjXuEFXTCvA5KTZfLE+uSpnmmk4yBzsmoJqUirXD
 BKOxd3JEfNjjUGpKjAyA5MbyX0a+4Y1V35R5u5fWL1cXZYQM7bjHMkc8+9vP95bxETTUZEWdS/b
 0wKkZyyTF3upabqhsTn8tJfsODWtefym+fxK3C7C1tWoZ3pGLJqIaMUJiHdSnOvfqAmZnvZeyec
 568ogkdMTVEcr9cDEDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 26-01-07 09:05:54, Luca Weiss wrote:
> Add the init sequence tables and config for the UFS QMP phy found in the
> Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
